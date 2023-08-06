#!/bin/bash

# Check if the script is run as root (required for certain scans)
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo or run as root."
  exit 1
fi

# Check if the target host is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <target>"
  exit 1
fi

# Store the target IP or hostname
target="$1"

# Set the output file name with a timestamp
output_file="nmap_scan_$(date +%Y%m%d_%H%M%S).txt"

# Nmap scan command
nmap_scan="nmap -T4 -A -v $target"

# Execute the Nmap scan and save the output to the file
echo "Running Nmap scan on $target..."
$nmap_scan > $output_file

echo "Scan completed. Results saved in: $output_file"

