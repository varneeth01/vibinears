#!/usr/bin/env bash
set -euo pipefail

echo "Checking for committed secret-like files..."

# Block real env files, but allow example env files.
if git ls-files | grep -E '(^|/)\.env($|\.)' | grep -vE '\.env(\.[a-zA-Z0-9_-]+)?\.example$|(^|/)\.env\.example$'; then
  echo "Real environment file is tracked by Git. Remove it immediately."
  exit 1
fi

# Block private keys, cert bundles, service accounts, and mobile secrets.
if git ls-files | grep -E '\.pem$|\.key$|\.p12$|\.pfx$|service-account.*\.json|google-services\.json|GoogleService-Info\.plist'; then
  echo "Secret-like file is tracked by Git. Remove it immediately."
  exit 1
fi

echo "Checking staged files..."

# Block staged real env files, but allow example env files.
if git diff --cached --name-only | grep -E '(^|/)\.env($|\.)' | grep -vE '\.env(\.[a-zA-Z0-9_-]+)?\.example$|(^|/)\.env\.example$'; then
  echo "Real environment file staged. Unstage it."
  exit 1
fi

if git diff --cached --name-only | grep -E '\.pem$|\.key$|\.p12$|\.pfx$|service-account.*\.json|google-services\.json|GoogleService-Info\.plist'; then
  echo "Secret-like file staged. Unstage it."
  exit 1
fi

echo "Security file check passed."
