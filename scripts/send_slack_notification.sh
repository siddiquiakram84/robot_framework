#!/bin/bash

SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

# Check if the tests passed or failed
if grep -q 'FAIL' results/output.xml; then
    STATUS="FAILED"
else
    STATUS="PASSED"
fi

# Send notification with report
curl -X POST -H 'Content-type: application/json' --data "{
    \"text\": \"API Test Results: ${STATUS}\",
    \"files\": [\"@results/report.html\"]
}" ${SLACK_WEBHOOK_URL}
