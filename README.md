# Fawry DevOps Internship Task Submission

**Name**: Lamia Alaa Eldeen Mohamed  
**Date**: April 28, 2025

This repository contains my solutions for the Fawry DevOps Internship Task. I have completed both questions (Q1 and Q2) along with their respective bonuses. Below are the details for each question, including screenshots and reflective answers where required.

## Q1: Custom Command (mygrep.sh)

### Solution
I implemented the `mygrep.sh` script to mimic the basic functionality of `grep`, supporting:
- Case-insensitive search.
- `-n` option (show line numbers).
- `-v` option (invert match).
- Combinations like `-vn` or `-nv`.
- Bonus: `--help` flag.

The script is located in the `q1_mygrep` folder: [mygrep.sh](q1_mygrep/mygrep.sh)

### Screenshots
- **Test Case 1: `./mygrep.sh hello testfile.txt`**  
 
- **Test Case 2: `./mygrep.sh -n hello testfile.txt`**  

- **Test Case 3: `./mygrep.sh -vn hello testfile.txt`**  

- **Test Case 4: `./mygrep.sh -v testfile.txt` (Error Case)**  

- **Test Case 5: `./mygrep.sh --help` (Bonus)**  
 
### Reflective Answers
1. **Breakdown of Argument and Option Handling**: The script uses a `while` loop to parse arguments, handling options (`-n`, `-v`, `-vn`, `-nv`, `--help`) via a `case` statement. Non-option arguments are assigned to `pattern` and `filename`, with validation for missing arguments and file readability.
2. **Supporting Regex or `-i`/`-c`/`-l` Options**: For regex, I’d modify `grep -qi` to `grep -E`. For `-i`, the script already uses `grep -qi`. For `-c`, I’d add a counter for matching lines. For `-l`, I’d print the filename if a match is found.
3. **Hardest Part**: Handling the `-vn` and `-nv` combinations was challenging, but I addressed it by explicitly checking both cases in the `case` statement.

## Q2: Scenario (Troubleshooting Connectivity)

### Solution
I troubleshooted the connectivity issue for `internal.example.com`, identifying and resolving issues related to DNS, service availability, and firewall settings. I also completed the bonuses:
- Configured a local `/etc/hosts` entry to bypass DNS.
- Persisted DNS settings using `systemd-resolved`.

### Screenshots
- **`cat /etc/resolv.conf`**  


- **`nslookup internal.example.com` (Failure)**  


- **`nslookup internal.example.com 8.8.8.8` (Success)**  
 
- **`curl -v http://172.31.7.163:80` (Initial Failure)**  


- **`curl -v https://172.31.7.163:443` (Initial Failure)**  

- **`telnet 172.31.7.163 80`**  

- **`telnet 172.31.7.163 443`**  

- **`netstat -tuln | grep -E '80|443'` (Before Fix)**  

- **`sudo systemctl status nginx`**  

- **`netstat -tuln | grep -E '80|443'` (After Fix)**  

- **`curl -v http://172.31.7.163:80` (After Fix)**  

- **`ufw status` (If Applicable)**  
 
- **`/etc/hosts` Update and `curl http://internal.example.com` (Bonus)**  

- **`systemd-resolve --status` (Bonus)**  

- **Final `curl http://internal.example.com`**  

## Notes
- All solutions were implemented on Ubuntu.
- The repository includes all required files and screenshots as per the task instructions.
