# 🔥 **Supersub - The Ultimate Subdomain Finder** 🔥

```
This tool is in upgrade. You can use the correct version.
```

**Supersub** is a powerful **subdomain enumeration tool** that helps you discover subdomains of any website with **custom response filtering**.  
It also includes **Header Injection Testing** to find vulnerabilities. 🚀  

---

## **🎯 Features**  
✅ **Find subdomains using multiple tools** (`Subfinder`, `Sublist3r`, `Amass`, `DNSRecon`)  
✅ **Filter results easily**:  
   - **Option 1**: Show only **200 OK** responses  
   - **Option 2**: Show everything **except 404**  
✅ **Header Injection Testing** (with `ffuf` for fuzzing)  
✅ **Asks for the directory to save outputs** (organized results)  
✅ **Automatically cleans up unnecessary files**  

---

## **📌 Installation & Usage**  

### **🔹 Install Required Dependencies**  
Before running Supersub, install the required tools:  
```bash
apt update && apt install -y subfinder sublist3r amass dnsrecon httpx ffuf
```
Or install them manually using:  
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest  
pip install sublist3r  
go install -v github.com/owasp-amass/amass/v3/...@master  
pip install dnsrecon  
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest  
go install -v github.com/ffuf/ffuf@latest  
```

### **🔹 Clone the Repository**  
```bash
git clone https://github.com/MDHojayfa/Supersub.git  
cd Supersub  
chmod +x supersub.sh  
```

### **🔹 Run the Script**  
```bash
./supersub.sh
```

---

## **🚀 How It Works**  
1️⃣ **Enter the target domain** (e.g., `example.com`)  
2️⃣ **Choose where to save the output**  
3️⃣ **Select your filtering option**:  
   - `1` → Show **only 200 OK** responses  
   - `2` → Show **everything except 404**  
4️⃣ *(Optional)* Perform **Header Injection Testing** by providing a **fuzzing wordlist**  

---

## **📸 Screenshot**  
> _(Coming Soon)_  

---

## **💡 Example Usage**  
```bash
./supersub.sh
# Enter domain: mysite.com
# Enter output directory: /home/user/results/
# Choose filtering: [1] Only 200 OK or [2] Exclude 404
# Perform header injection? [y/n]: y
# Enter header format: X-Forwarded-For: FUZZ.mysite.com
# Enter wordlist: /usr/share/wordlists/rockyou.txt
```
✔ **Results saved in `/home/user/results/`**  

---

## **⚠️ Disclaimer**  
```diff
+ This tool is meant for educational and ethical hacking purposes only.
+ Do NOT use it on websites without permission.
- You are responsible for your actions!
```

---

## **⭐ Like this tool? Support & Contribute!**  
- **🌟 Star this repo**  
- **🍴 Fork & improve** it  
- **🐛 Report issues & suggest features**  

---

🔥 **Download & Try Supersub Now!** [👉 Click Here](https://github.com/MDHojayfa/Supersub.git) 🚀  

