#!/bin/bash

# Ask for user input
read -p "Enter the target domain (e.g., mysite.com): " domain
read -p "Enter the directory to save results (e.g., /home/user/output/): " dir
mkdir -p "$dir"

# Create file paths
raw_subs="$dir/raw_subdomains.txt"
final_subs="$dir/final_subdomains.txt"
filtered_subs="$dir/filtered_subdomains.txt"

echo "[+] Finding subdomains for: $domain"
echo "[+] Results will be saved in: $dir"
echo "------------------------------------"

# Run Subdomain Enumeration
echo "[*] Running Subfinder..."
subfinder -d $domain >> $raw_subs

echo "[*] Running Sublist3r..."
sublist3r -d $domain -o $raw_subs 2>/dev/null

echo "[*] Running Amass..."
amass enum -d $domain >> $raw_subs

echo "[*] Running DNSRecon brute-force..."
dnsrecon -d $domain -t brt -D /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt | grep "A" | awk '{print $2}' >> $raw_subs

# Remove duplicate subdomains
sort -u $raw_subs -o $raw_subs

# Ask user how to filter subdomains
echo "------------------------------------"
echo "Choose Filtering Option:"
echo "1) Only show subdomains with 200 OK"
echo "2) Show all except 404"
read -p "Enter your choice (1/2): " filter_option

# Check live subdomains & filter
if [[ $filter_option == "1" ]]; then
    echo "[*] Filtering subdomains with only 200 OK..."
    cat $raw_subs | httpx -silent -status-code | grep "[200]" | awk '{print $1}' | tee $filtered_subs
elif [[ $filter_option == "2" ]]; then
    echo "[*] Filtering subdomains (excluding 404)..."
    cat $raw_subs | httpx -silent -status-code | grep -v "[404]" | awk '{print $1}' | tee $filtered_subs
else
    echo "[!] Invalid choice. Showing all subdomains."
    cp $raw_subs $filtered_subs
fi

# Move final results
mv $filtered_subs $final_subs
echo "[+] Final subdomains saved in: $final_subs"

# Ask if user wants to perform Header Injection Testing
echo "------------------------------------"
read -p "Do you want to perform Header Injection testing? (y/n): " inject_option
if [[ $inject_option == "y" ]]; then
    read -p "Enter the header format (e.g., X-Forwarded-For: FUZZ.$domain): " header
    read -p "Enter the target URL path (e.g., /admin): " target_path
    read -p "Enter the wordlist path for fuzzing: " wordlist

    echo "[*] Starting Header Injection Testing..."
    ffuf -w $wordlist -u "https://FUZZ.$domain$target_path" -H "$header" -mc 200,403 | tee "$dir/header_injection_results.txt"
    
    echo "[+] Header Injection results saved in: $dir/header_injection_results.txt"
else
    echo "[+] Skipping Header Injection testing."
fi

# Clean up unnecessary files
rm $raw_subs

echo "[✔] Process completed. Final results saved in: $final_subs"
