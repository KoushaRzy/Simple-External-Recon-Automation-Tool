# Simple External Recon Automation Tool

A simple and efficient automation tool for performing external reconnaissance on a target URL. The tool uses various subdomain enumeration, DNS lookup, Whois, and web archive tools to gather valuable data about a target domain. All the results are saved in a structured directory, making it easy for users to analyze and collect the reconnaissance data.

## Features
- **Subdomain enumeration** using `subfinder` and `assetfinder`.
- **DNS Lookup** for A records using `dig`.
- **Whois lookup** to gather domain registration details.
- **Web Archive data** retrieval using `curl`.
- **Mass DNS resolution** with `massdns` for found subdomains.
- **Result storage** in a dedicated directory with detailed logs.
- **Output filtering** to remove duplicate entries and merge results.

## Requirements

- `subfinder` – Subdomain enumeration tool.
- `assetfinder` – Another subdomain discovery tool.
- `dig` – DNS lookup utility for querying domain records.
- `whois` – Whois lookup tool.
- `curl` – For querying the Wayback Machine (web archive).
- `massdns` – Fast DNS resolution tool.
- A Unix-like OS (Linux, macOS, WSL) for best compatibility (Kali Linux is recommended).
- ---------------------------------------------------------------------------------------------
Enter the target URL please...
example.com
Enter the directory where you want to save the results (e.g., /path/to/External_Recon):
/path/to/save/results
Running Subfinder for subdomain enumeration...
Running Assetfinder for additional subdomains...
Running Dig for DNS A records...
Running Whois for domain information...
Running Web Archive queries...
Resolving subdomains with MassDNS...
All results saved in /path/to/save/results/results_2024-11-21/final_results/final_filtered_results.txt
----------------------------------------------------------------------------------------------------------
Output Directory Structure :
  /path/to/save/results/
    │
    ├── results_2024-11-21/
    │   ├── dig_output.txt
    │   ├── whois_output.txt
    │   ├── subfinder_output.txt
    │   ├── assetfinder_output.txt
    │   ├── webarcheive_output.txt
    │   ├── final_subdomains.txt
    │   ├── massdns_res.txt
    │   └── final_results/
    │       └── final_filtered_results.txt
