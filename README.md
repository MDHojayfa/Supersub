# Supersub - Advanced Subdomain Enumeration Tool

```
███████╗██╗   ██╗██████╗ ███████╗███████╗██████╗
██╔════╝██║   ██║██╔══██╗██╔════╝██╔════╝██╔══██╗
███████╗██║   ██║██████╔╝█████╗  █████╗  ██████╔╝
╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══╝  ██╔═══╝
███████║╚██████╔╝██║     ███████╗███████╗██║     
```

**Made by MDHojayfa** 🚀

Supersub হল একটি শক্তিশালী ও উন্নত সাবডোমেইন এনুমারেশন টুল যা একাধিক টুল ব্যবহার করে সাবডোমেইন খুঁজে বের করে এবং বিভিন্ন ফিল্টার অপশন ব্যবহার করে লাইভ সাবডোমেইন ফিল্টার করতে সাহায্য করে। *(Supersub is a powerful and advanced subdomain enumeration tool that uses multiple tools to find subdomains and helps filter live subdomains using various filter options.)*

---

## 🔥 Features *(ফিচারসমূহ)*
✅ **Multiple Source Integration** - Subfinder, Sublist3r, Amass, DNSRecon ইত্যাদি ব্যবহার করে সাবডোমেইন সংগ্রহ *(Collect subdomains using Subfinder, Sublist3r, Amass, DNSRecon, etc.)*  
✅ **Wildcard Filtering** - অবাঞ্ছিত ওয়াইল্ডকার্ড সাবডোমেইন ফিল্টার করা *(Filter unwanted wildcard subdomains)*  
✅ **Live Domain Checking** - HTTP স্ট্যাটাস কোড চেক করে ২০০ বা অন্যান্য লাইভ সাবডোমেইন খুঁজে বের করা *(Check HTTP status codes to find live subdomains with 200 OK or other valid responses)*  
✅ **Response Time Sorting** - দ্রুততম সাবডোমেইন চিহ্নিত করতে রেসপন্স টাইম অনুযায়ী সাজানো *(Sort subdomains by response time to identify the fastest ones)*  
✅ **HTTP Parameter Discovery** - ভিন্ন HTTP প্যারামিটার খুঁজে বের করা *(Discover different HTTP parameters)*  
✅ **Built-in Directory Bruteforcing** - গোবাস্টার ব্যবহার করে সাবডোমেইন ব্রুটফোর্স করা *(Perform directory bruteforcing on subdomains using Gobuster)*  
✅ **Report Generation** - HTML/PDF আকারে রিপোর্ট তৈরি করা *(Generate reports in HTML/PDF format)*  
✅ **Header Injection Testing** - ফাজিং এর মাধ্যমে হেডার ইনজেকশন টেস্ট করা *(Test header injection using fuzzing techniques)*  

---

## 🚀 Installation *(ইনস্টলেশন)*
```bash
# প্রথমে টুল ক্লোন করুন *(Clone the tool first)*
git clone https://github.com/MDHojayfa/Supersub.git

# ডিরেক্টরিতে যান *(Navigate to the directory)*
cd Supersub

# স্ক্রিপ্ট রান করার পারমিশন দিন *(Give execution permission to the script)*
chmod +x supersub.sh

# রান করুন *(Run the script)*
./supersub.sh
```

---

## 🎯 Usage *(ব্যবহারবিধি)*
```bash
./supersub.sh
```
তারপর স্ক্রিপ্ট আপনাকে টার্গেট ডোমেইন, আউটপুট ডিরেক্টরি এবং অন্যান্য সেটিংস ইনপুট দিতে বলবে। *(The script will then prompt you to input the target domain, output directory, and other settings.)*

**Advanced Options:** আপনি চাইলে এডভান্স অপশন চালু করে আরও ফিচার ব্যবহার করতে পারবেন। *(You can enable advanced options if you want to use more features.)*

---

## 🛠 Dependencies *(প্রয়োজনীয় টুলসমূহ)*
Ensure you have the following installed: *(নিচের টুলগুলো ইনস্টল করা আছে কিনা নিশ্চিত করুন:)*
```bash
sudo apt install subfinder sublist3r amass dnsrecon httpx ffuf gobuster pandoc
```

---

## 📜 Example *(উদাহরণ)*
```bash
Enter the target domain (e.g., mysite.com): example.com
Enter the directory to save results (e.g., /home/user/output/): /home/user/output
Enable Advanced Options? (y/n): y
Perform Header Injection Testing? (y/n): y
```

---

## 📢 Disclaimer *(দায়িত্ব অস্বীকার)*
**This tool is for educational and security testing purposes only. Unauthorized use on external domains without permission is strictly prohibited.**  
*(এই টুলটি শুধুমাত্র শিক্ষামূলক এবং সিকিউরিটি টেস্টিংয়ের জন্য। অনুমতি ছাড়া বাইরের ডোমেইনে ব্যবহার করা আইনগতভাবে নিষিদ্ধ।)*

---

## 📬 Contact *(যোগাযোগ)*
For any issues or feature requests, feel free to open an issue on [GitHub](https://github.com/MDHojayfa/Supersub)!  
*(যেকোন সমস্যা বা নতুন ফিচারের অনুরোধের জন্য GitHub-এ issue খুলতে পারেন!)*

Happy Hacking! 😈 *(শুভ হ্যাকিং! 😈)*

