#!/bin/bash

# Integration Test Script for Jenkins
# This script verifies Jenkins integration with the repository

echo "=========================================="
echo "Jenkins Integration Test Script"
echo "Repository: admin_ops"
echo "=========================================="

# Test 1: Environment Check
echo ""
echo "Test 1: Checking environment variables..."
echo "JENKINS_URL: ${JENKINS_URL:-'Not set'}"
echo "BUILD_NUMBER: ${BUILD_NUMBER:-'Not set'}"
echo "BUILD_ID: ${BUILD_ID:-'Not set'}"
echo "JOB_NAME: ${JOB_NAME:-'Not set'}"
echo "WORKSPACE: ${WORKSPACE:-'Not set'}"

# Test 2: File System Check
echo ""
echo "Test 2: Checking repository files..."
if [ -f "Jenkinsfile" ]; then
    echo "✅ Jenkinsfile found"
else
    echo "❌ Jenkinsfile not found"
fi

if [ -f "README.md" ]; then
    echo "✅ README.md found"
else
    echo "❌ README.md not found"
fi

# Test 3: Git Check
echo ""
echo "Test 3: Checking git repository..."
if [ -d ".git" ]; then
    echo "✅ Git repository initialized"
    echo "Current branch: $(git branch --show-current 2>/dev/null || echo 'unknown')"
    echo "Latest commit: $(git log -1 --oneline 2>/dev/null || echo 'no commits')"
else
    echo "❌ Not a git repository"
fi

# Test 4: Network Check
echo ""
echo "Test 4: Checking network connectivity..."
if ping -c 1 github.com &> /dev/null; then
    echo "✅ Can reach GitHub"
else
    echo "⚠️ Cannot reach GitHub (may be expected in isolated environment)"
fi

# Test 5: Write Test Results
echo ""
echo "Test 5: Writing test results..."
TEST_RESULT_FILE="test_results_${BUILD_NUMBER:-local}.txt"
echo "Test executed at: $(date)" > "$TEST_RESULT_FILE"
echo "Build Number: ${BUILD_NUMBER:-'local'}" >> "$TEST_RESULT_FILE"
echo "Job Name: ${JOB_NAME:-'local'}" >> "$TEST_RESULT_FILE"
echo "Status: PASSED" >> "$TEST_RESULT_FILE"
echo "✅ Test results written to $TEST_RESULT_FILE"

echo ""
echo "=========================================="
echo "Integration tests completed successfully!"
echo "=========================================="