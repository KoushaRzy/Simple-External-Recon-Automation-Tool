#!/bin/bash

echo "Enter the target URL please..."
read Target_URL

while true; do
    echo "Enter the directory where you want to save the results (e.g., /path/to/External_Recon):"
    read output_dir

    if [ -z "$output_dir" ]; then
        echo "Error: You must enter a directory path. Please try again."
    elif [ -d "$output_dir" ]; then
        echo "Error: The directory '$output_dir' already exists. Please enter a different directory name."
    else
        mkdir -p "$output_dir"
        break
    fi
done

timestamp=$(date +"%Y-%m-%d")
result_dir="$output_dir/results_$timestamp"
mkdir -p "$result_dir"

final_subdomains_file="$result_dir/final_subdomains.txt"
dig_file="$result_dir/dig_output.txt"
whois_file="$result_dir/whois_output.txt"
webArcheive_file="$result_dir/webarcheive_output.txt"
subfinder_file="$result_dir/subfinder_output.txt"
assetfinder_file="$result_dir/assetfinder_output.txt"

dig +short A "$Target_URL" > "$dig_file"
echo "The DNS A records have been saved to $dig_file"

whois "$Target_URL" > "$whois_file"
echo "The Whois record result has been saved to $whois_file"

curl -s "https://web.archive.org/cdx/search/cdx?url=*.$Target_URL&collapse=urlkey&fl=original" \
| cut -d "/" -f3 > "$webArcheive_file"
echo "The Web Archive record result has been saved to $webArcheive_file
remember to use sort -u after you have result "

subfinder -d $Target_URL -o $subfinder_file
echo "The Subfinder record result has been saved to $subfinder_file"

assetfinder $Target_URL > $assetfinder_file
echo "The Assetfinder record result has been saved to $assetfinder_file"

echo "All results have been saved in the directory: $result_dir"

cat "$subfinder_file" "$assetfinder_file" "$webArcheive_file" | sort | uniq > "$final_subdomains_file"
echo "All unique subdomains from Subfinder, Assetfinder, and Web Archive have been merged and saved to $final_subdomains_file"
