# CTF-in-a-Box: A Beginner's Challenge

This is a simple, all-in-one CTF (Capture The Flag) virtual machine designed for beginners. It's built with Vagrant and a simple shell script.

The box contains **3 flags** for you to find, each testing a different skillset:
1.  **Web:** Enumeration
2.  **Network:** Service Discovery
3.  **Linux:** Privilege Escalation

---

## 🚀 How to Use

### Prerequisites
You must have these two programs installed:
1.  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2.  [Vagrant](https://www.vagrantup.com/downloads)

### Launching the Box
1.  Download this project (Click **Code -> Download ZIP**).
2.  Unzip the folder.
3.  Open your terminal or PowerShell, `cd` into the project folder, and run:
    ```bash
    vagrant up
    ```
4.  Wait 5-10 minutes for the box to build itself.

Once it's finished, your target is live at `192.168.33.10`.
##steghide is preinstalled 
company-logo

---

## 🏁 Your Goal

Your goal is to find all 3 flags. Good luck!

* **Flag 1 (Web):** `flag{...}`
* **Flag 2 (Network):** `flag{...}`
* **Flag 3 (Root):** `flag{...}`

### How to Clean Up
When you are finished, run this command from the same folder:
```bash
vagrant destroy -f
