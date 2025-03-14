#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Tool Banner
echo -e "${MAGENTA}███████╗███████╗██████╗ ███████╗${NC}"
echo -e "${MAGENTA}██╔════╝██╔════╝██╔══██╗██╔════╝${NC}"
echo -e "${MAGENTA}█████╗  █████╗  ██████╔╝█████╗  ${NC}"
echo -e "${MAGENTA}██╔══╝  ██╔══╝  ██╔═══╝ ██╔══╝  ${NC}"
echo -e "${MAGENTA}██║     ██║     ██║     ███████╗${NC}"
echo -e "${CYAN}------------------------------------${NC}"
echo -e "${YELLOW}★ SuperSub Advanced ★${NC}"
echo -e "${CYAN}Made By MDHojayfa${NC}"
echo -e "${CYAN}------------------------------------${NC}"
sleep 1

# Ask for user input
echo -e "${GREEN}[+] Enter the target domain:${NC}"
read -p "(e.g., mysite.com): " domain
echo -e "${GREEN}[+] Enter the directory to save results:${NC}"
read -p "(e.g., /home/user/output/): " dir
mkdir -p "$dir"

# Create file paths
raw_subs="$dir/raw_subdomains.txt"
final_subs="$dir/final_subdomains.txt"
filtered_subs="$dir/filtered_subdomains.txt"

# Subdomain Enumeration
echo -e "${YELLOW}[*] Finding subdomains for: $domain${NC}"
echo -e "${YELLOW}[*] Results will be saved in: $dir${NC}"
subfinder -d $domain >> $raw_subs
sublist3r -d $domain -o $raw_subs 2>/dev/null
amass enum -d $domain >> $raw_subs
dnsrecon -d $domain -t brt -D /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt | grep "A" | awk '{print $2}' >> $raw_subs

# Remove duplicates
sort -u $raw_subs -o $raw_subs

# Filtering Options
echo -e "${BLUE}[+] Choose Filtering Option:${NC}"
echo "1) Only show subdomains with 200 OK"
echo "2) Show all except 404"
read -p "Enter your choice (1/2): " filter_option
if [[ $filter_option == "1" ]]; then
    cat $raw_subs | httpx -silent -status-code | grep "[200]" | awk '{print $1}' | tee $filtered_subs
elif [[ $filter_option == "2" ]]; then
    cat $raw_subs | httpx -silent -status-code | grep -v "[404]" | awk '{print $1}' | tee $filtered_subs
else
    cp $raw_subs $filtered_subs
fi

# Advanced Features
echo -e "${GREEN}[+] Enable Advanced Options? (y/n): ${NC}"
read advanced_option
if [[ $advanced_option == "y" ]]; then
    echo "[*] Running Additional Features..."
    cat $filtered_subs | sort | uniq | tee $filtered_subs
    cat $filtered_subs | httpx -silent | tee "$dir/live_subdomains.txt"
    cat $dir/live_subdomains.txt | httpx -silent -response-time | sort -k2 -n | tee "$dir/sorted_subdomains.txt"
    cat $dir/sorted_subdomains.txt | gf xss | tee "$dir/http_params.txt"
    cat $dir/sorted_subdomains.txt | xargs -I % gobuster dir -u % -w /usr/share/seclists/Discovery/Web-Content/common.txt -o "$dir/directory_bruteforce.txt"
    read -p "Generate Report? (html/pdf): " report_format
    if [[ $report_format == "html" ]]; then
        cat $dir/sorted_subdomains.txt | awk '{print "<li>"$1"</li>"}' > "$dir/report.html"
    elif [[ $report_format == "pdf" ]]; then
        pandoc "$dir/sorted_subdomains.txt" -o "$dir/report.pdf"
    fi
fi

# Header Injection
echo -e "${BLUE}[+] Perform Header Injection Testing? (y/n): ${NC}"
read inject_option
if [[ $inject_option == "y" ]]; then
    read -p "Enter the header format (e.g., X-Forwarded-For: FUZZ.$domain): " header
    read -p "Enter the target URL path (e.g., /admin): " target_path
    read -p "Enter the wordlist path: " wordlist
    if [[ ! "$header" =~ ":" ]]; then
        echo "[!] Invalid header format!"
        exit 1
    fi
    ffuf -w "$wordlist" -u "https://FUZZ.$domain$target_path" -H "$header" -mc 200,403 | tee "$dir/header_injection_results.txt"
fi

# Final Verification
echo -e "${YELLOW}[+] Final Check before saving results? (y/n): ${NC}"
read final_check
if [[ $final_check == "y" ]]; then
    cat $filtered_subs | httpx -silent -status-code | grep "[200]" | awk '{print $1}' | tee "$final_subs"
else
    cp $filtered_subs $final_subs
fi

echo -e "${GREEN}[✔] Process completed. Final results saved in: $final_subs${NC}"
