#!/bin/bash
APP_URL="https://www.inbestments.com/app/" 
check_application_status() {
    response_code=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")

    if [ "$response_code" == "200" ]; then
        echo "Application is UP. HTTP Status Code: $response_code"
        exit 0
    else
        echo "Application is DOWN. HTTP Status Code: $response_code"
        exit 1
    fi
}

check_application_status
