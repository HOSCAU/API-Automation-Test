API Automation Testing Framework
 Overview
This is a Robot Framework-based API automation testing suite designed to validate RESTful APIs. The framework includes tests for various HTTP methods (GET, POST, PUT) with both positive and negative test scenarios.

🛠 Prerequisites
Required Software
Python 3.8 or higher

pip (Python package manager)

Git (for version control)

Verify Installation
bash
# Check Python version
python --version

# Check pip version
pip --version

# Check Git version
git --version
⚙️ Setup Instructions
1. Clone the Repository
bash
git clone <repository-url>
cd API-Automation
2. Create Virtual Environment (Recommended)
bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
3. Install Dependencies
bash
pip install -r requirements.txt
If you don't have a requirements.txt file, install packages individually:

bash
pip install robotframework
pip install robotframework-requests
pip install requests
4. Verify Installation
bash
python -c "import robot; print('Robot Framework installed successfully')"
python -c "import RequestsLibrary; print('RequestsLibrary installed successfully')"
 Project Structure
text
API-Automation/
├── tests/
│   ├── get_user_tests.robot      # GET API tests
│   ├── post_api_tests.robot      # POST API tests  
│   ├── put_api_tests.robot       # PUT API tests
│   └── (other test files)
├── results/                      # Test results (auto-generated)
├── README.md                     # This file
└── requirements.txt              # Python dependencies
 Test Execution
Running All Tests
bash
python -m robot tests/
Running Specific Test Files
bash
# Run GET API tests
python -m robot tests/get_user_tests.robot

# Run POST API tests  
python -m robot tests/post_api_tests.robot

# Run PUT API tests
python -m robot tests/put_api_tests.robot
Running Tests with Specific Options
bash
# Run tests with detailed log
python -m robot --loglevel DEBUG tests/

# Run tests and specify output directory
python -m robot --outputdir results/ tests/

# Run specific test cases by name
python -m robot --test "Create New User With Valid Data" tests/
🔧 Testing Procedures
1. Test Development Workflow
Analyze API endpoints and requirements

Design test cases covering:

Positive scenarios (valid inputs)

Negative scenarios (invalid inputs)

Edge cases (boundary values)

Implement tests in Robot Framework

Execute tests and analyze results

Debug failures and update tests as needed

2. Test Case Structure
Each test file follows this pattern:

robot
*** Settings ***
# Libraries and setup

*** Variables ***
# API endpoints and test data

*** Keywords ***
# Reusable helper functions

*** Test Cases ***
# Individual test scenarios
3. API Testing Coverage
 GET Operations: Retrieve user data, handle pagination

 POST Operations: Create new resources, validate responses

PUT Operations: Update existing resources

 Status Code Validation: Verify HTTP response codes

 Response Body Validation: Check JSON structure and content

 Error Handling: Test API behavior with invalid inputs

 Test Results
After test execution, the framework generates:

output.xml: Machine-readable results

log.html: Detailed execution log

report.html: Test summary report

Viewing Results
bash
# Open the HTML report in your browser
# On Windows:
start report.html
# On macOS:
open report.html
# On Linux:
xdg-open report.html
 Troubleshooting
Common Issues
1. "File or directory does not exist" error
Problem: Robot Framework can't find the test file
Solution:

bash
# Check current directory
pwd

# List files to verify test file exists
ls -la tests/

# Run from correct directory
cd /path/to/API-Automation
python -m robot tests/post_api_tests.robot
2. Import errors for RequestsLibrary
Problem: Missing required library
Solution:

bash
pip install robotframework-requests
3. API connection issues
Problem: 401 Unauthorized or connection errors
Solution:

Verify API endpoint is accessible

Check if API requires authentication

Test with different endpoints like JSONPlaceholder

4. Virtual environment issues
Problem: Packages not found in virtual environment
Solution:

bash
# Reactivate virtual environment
venv\Scripts\activate  # Windows
source venv/bin/activate  # macOS/Linux

# Reinstall packages
pip install -r requirements.txt
Maintenance
Adding New Tests
Create new .robot file in tests/ directory

Follow existing test structure and naming conventions

Include both positive and negative scenarios

Update this README if adding new test categories

Updating Dependencies
bash
# Update requirements.txt
pip freeze > requirements.txt

# Install updated dependencies
pip install -r requirements.txt
 Best Practices
Test Design
Write clear, descriptive test case names

Include both happy path and error scenarios

Make tests independent and repeatable

Use variables for reusable values

Code Organization
Group related tests in the same file

Use keywords for reusable test steps

Keep tests focused on one functionality

Document complex test logic with comments

Execution
Run tests regularly in CI/CD pipeline

Review test reports for flaky tests

Update tests when API changes

Monitor test execution time

 Support
If you encounter issues:

Check the troubleshooting section above

Verify all prerequisites are installed

Check test execution logs in log.html

Review Robot Framework documentation

 Resources
Robot Framework Documentation

RequestsLibrary Documentation

JSONPlaceholder API Guide

Happy Testing! 


