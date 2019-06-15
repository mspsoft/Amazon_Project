*** Settings ***
Library  Selenium2Library

*** Keywords ***
Load
    Go To  http://www.amazon.in
    maximize browser window

Verify Page Loaded
    Wait Until Page Contains  Your Amazon.com
