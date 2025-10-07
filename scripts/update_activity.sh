#!/usr/bin/env bash
set -euo pipefail

# Create a small file with the current UTC timestamp so it changes each run.
mkdir -p activity
echo "$(date -u '+%Y-%m-%d %H:%M:%S UTC')" > activity/last-activity.txt
