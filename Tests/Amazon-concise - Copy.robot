*** Settings ***
Documentation  These test cases use a 2nd level keyword to wrap up multiple 1st level keywords for brevity
Resource  ../Resources/PO/Keywords/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/Keywords/Amazon.robot
Resource  ../TestSuite/Mobile/FirstRobotFile.robot
Suite Setup  Set Library Search Order  Selenium2Library  AppiumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the below command to Terminal to execute:
# robot -d results/concise tests/amazon-concise.robot
# Command - robot -d Results -A TestSuite/Config/config.args "Tests/Amazon-concise - Copy.robot"

*** Test Cases ***
A User is able to add products in cart
#    user is not logged in
 #   LandingPage.Load
 #Open the desired website to search
    Access Amazon Application Using Google Search
    User login into application with UserName and Password
    Verify user has successfully logged into the application
    Search for the desired product using ProductName
    Select the desired product from the list  Dell 5480 AD/Backlit KB Clear Screen
    Add the desired product into your shopping cart
    Logout from Application
    Close the Browser
    Verify on Mobile app





