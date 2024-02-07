#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80

check_cpu_usage() {
    local cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
    if [ $cpu_usage -gt $CPU_THRESHOLD ]; then
        echo "High CPU usage detected: ${cpu_usage}%"
        echo "High CPU usage detected: ${cpu_usage}%" >> system_health.log
    fi
}

check_memory_usage() {
    local memory_usage=$(free | awk '/Mem/ {print $3/$2 * 100}')
    if [ $(printf "%.0f" "$memory_usage") -gt $MEMORY_THRESHOLD ]; then
        echo "High memory usage detected: ${memory_usage}%"
        echo "High memory usage detected: ${memory_usage}%" >> system_health.log
    fi
}

check_cpu_usage
check_memory_usage

echo "System health check completed."
