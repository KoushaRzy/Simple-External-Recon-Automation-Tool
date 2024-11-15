Subdomain Recon Tool

A bash script for automating subdomain discovery and DNS reconnaissance. It collects data from multiple sources and organizes the results in a structured way.
Features

    DNS A Records: Retrieves DNS A records using dig.
    WHOIS Info: Fetches WHOIS records.
    Web Archive: Queries the Wayback Machine for historical subdomains.
    Subdomain Enumeration: Uses Subfinder and Assetfinder to find subdomains.
    Result Organization: Saves the output in a folder with timestamps.

Prerequisites

Make sure you have these tools installed:

    dig
    whois
    curl
    Subfinder
    Assetfinder

Installation

    Clone the repository:

git clone https://github.com/yourusername/subdomain-recon-tool.git
cd subdomain-recon-tool

Make the script executable:

    chmod +x subdomain_recon.sh

Usage

    Run the script:

    ./subdomain_recon.sh

    Enter the target URL and output directory when prompted. The tool will create a timestamped results folder with the following files:
        dig_output.txt: DNS A records.
        whois_output.txt: WHOIS info.
        webarcheive_output.txt: Web Archive data.
        subfinder_output.txt: Subdomains from Subfinder.
        assetfinder_output.txt: Subdomains from Assetfinder.
        final_subdomains.txt: Merged and unique subdomains.

Example Output

/path/to/output/results_2024-11-15/
├── final_subdomains.txt
├── dig_output.txt
├── whois_output.txt
├── webarcheive_output.txt
├── subfinder_output.txt
└── assetfinder_output.txt
