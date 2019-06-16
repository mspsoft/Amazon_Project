*** Settings ***
Documentation  These test cases use a 2nd level keyword to wrap up multiple 1st level keywords for brevity
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/Keywords/Amazon.robot
Resource  ../TestSuite/Mobile/FirstRobotFile.robot
Suite Setup  Set Library Search Order  Selenium2Library  AppiumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the below command to Terminal to execute:
# Command - robot -d Results -A TestSuite/Mobile/Configuration/config.args Tests/Amazon-concise.robot

*** Test Cases ***

Search a Dell Laptop
    user is not logged in
    LandingPage.Load
    Login Into Amazon
    Verify Login Successful
    Search Amazon
    Select Product  Dell 5480 AD/Backlit KB Clear Screen
    Add To Cart1
    Logout from Application
    Verify on Mobile app










