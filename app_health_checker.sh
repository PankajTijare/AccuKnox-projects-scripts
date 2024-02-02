#!/bin/bash

APP_URL="https://www.inbestments.com/app/"  # Replace with your application URL

check_application_status() {
    # Make an HTTP request to the application
    response_code=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")

    # Check the HTTP status code
    if [ "$response_code" == "200" ]; then
        echo "Application is UP. HTTP Status Code: $response_code"
        exit 0
    else
        echo "Application is DOWN. HTTP Status Code: $response_code"
        exit 1
    fi
}

# Run the application status check function
check_application_status
