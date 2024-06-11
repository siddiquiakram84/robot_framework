#!/bin/bash

SLACK_WEBHOOK_URL="https://hooks.slack.com/"
REPORT_FILE="/app/results/report.html"
API_HEALTH_URL="http://localhost:5000/health"

# Check if the tests passed or failed
if grep -q 'FAIL' /app/results/output.xml; then
    STATUS="FAILED"
else
    STATUS="PASSED"
fi

# Get the Flask API health status
API_HEALTH=$(curl -s -o /dev/null -w "%{http_code}" ${API_HEALTH_URL})

# Prepare the message payload
MESSAGE_PAYLOAD="{
    \"text\": \"API Test Results: ${STATUS}\",
    \"attachments\": [
        {
            \"title\": \"API Health Report\",
            \"fields\": [
                {
                    \"title\": \"Test Status\",
                    \"value\": \"${STATUS}\",
                    \"short\": true
                },
                {
                    \"title\": \"Flask API Health\",
                    \"value\": \"${API_HEALTH}\",
                    \"short\": true
                }
            ]
        }
    ],
    \"files\": [\"@${REPORT_FILE}\"]
}"

# Send notification with report and health status
curl -X POST -H 'Content-type: application/json' --data "${MESSAGE_PAYLOAD}" ${SLACK_WEBHOOK_URL}
