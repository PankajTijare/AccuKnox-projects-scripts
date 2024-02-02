#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"  # Replace with the path to your web server log file

analyze_logs() {
    # Check if the log file exists
    if [ ! -f "$LOG_FILE" ]; then
        echo "Log file not found: $LOG_FILE"
        exit 1
    fi

    echo "Analyzing logs: $LOG_FILE"

    # Count 404 errors
    echo -e "\n=== 404 Errors ==="
    grep "HTTP/1.1\" 404" "$LOG_FILE" | awk '{print $7}' | sort | uniq -c | sort -nr

    # Most requested pages
    echo -e "\n=== Most Requested Pages ==="
    awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10

    # IP addresses with the most requests
    echo -e "\n=== Top IP Addresses ==="
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10
}

# Run the log analysis function
analyze_logs
