#!/bin/bash

# Set the colors for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to run tests
run_tests() {
  echo -e "${YELLOW}Running all tests...${NC}"
  
  # Run the tests and save the output
  flutter test --coverage > test_output.txt 2>&1
  
  # Check if tests passed or failed
  if grep -q 'All tests passed!' test_output.txt; then
    echo -e "${GREEN}All tests passed!${NC}"
  else
    echo -e "${RED}Some tests failed.${NC}"
    echo -e "${YELLOW}Here are the details:${NC}"
    grep -A 10 'Some tests failed' test_output.txt
  fi

  # Generate coverage report (if coverage is enabled)
  if [ -f "coverage/lcov.info" ]; then
    echo -e "${YELLOW}Generating coverage report...${NC}"
    genhtml coverage/lcov.info -o coverage_report
    echo -e "${GREEN}Coverage report generated in the coverage_report directory.${NC}"
  fi
}

# Run the tests
run_tests

# Cleanup
rm -f test_output.txt
