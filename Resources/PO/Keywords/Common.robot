*** Settings ***
Library  Selenium2Library

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    # Maximize Browser Window

End Web Test
    Close Browser

Open the desired website to search
    Go To  http://www.amazon.in
    maximize browser window

Verify Page Loaded
    Wait Until Page Contains  Your Amazon.com

Close the Browser
    Close Browser

