*** Settings ***
Documentation  These test cases use a 2nd level keyword to wrap up multiple 1st level keywords for brevity
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/Keywords/Amazon.robot
Resource  ../TestSuite/Mobile/FirstRobotFile.robot
Suite Setup  Set Library Search Order  Selenium2Library  AppiumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the below command to Terminal to execute:
# pybot -d results/concise tests/amazon-concise.robot

*** Test Cases ***
#Logged out user can search for products
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    When user searches for products
#    Then search results contains relevant products
Search a Dell Laptop
    user is not logged in
    LandingPage.Load
    Login Into Amazon
    Verify Login Successful
    Search Amazon
    Select Product
    Add To Cart1
    Logout from Application
    Open Android app


#Logged out user can view a product
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    When user selects a searched product
#    Then correct product page loads
#
#Logged out user can add product to cart
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    And user selects a searched product
#    When user adds that product to their cart
#    Then the product is present in cart
#
#Logged out user must sign in to check out
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    And user adds a product to their cart
#    When user attempts to checkout
#    Then the user is required to sign in
#







