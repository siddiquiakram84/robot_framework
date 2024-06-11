# API Testing Automation Framework

## Prerequisites

1. **Docker**: Install Docker.
2. **AWS CLI**: Install and configure AWS CLI.
3. **Slack Webhook**: Create a Slack webhook for notifications.

## Project Structure

```

project_name/
├── logs/                    # Directory to store log files
├── results/                 # Directory to store test results
├── reports/                 # Directory to store test reports
├── lib/                     # Directory for custom Python libraries
├── resources/               # Directory for reusable resources
│   ├── keywords/            # Directory for custom keywords
│   ├── libraries/           # Directory for external libraries (if any)
│   └── variables/           # Directory for variable files
├── robot_tests/             # Root directory for Robot Framework tests
│   ├── test_cases/          # Directory for test case files
│   └── test_suites/         # Directory for test suite files
├── requirements.txt         # File listing project dependencies
├── robot_tests.py           # Python script for helper functions (if needed)
├── Dockerfile               # Dockerfile for containerization
├── buildspec.yml            # Build specifications for CI/CD
├── environment.py           # Python configuration file for environment settings
├── entrypoint.sh            # Script to run tests and send notifications
├── configs/                 # Directory for environment-specific configuration files
│   ├── dev.py               # Configuration for development environment
│   ├── staging.py           # Configuration for staging environment
│   └── prod.py              # Configuration for production environment
└── scripts/                 # Directory for supporting scripts
    └── send_slack_notification.sh  # Script to send Slack notifications
```