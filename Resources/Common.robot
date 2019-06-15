*** Settings ***
Library  Selenium2Library  run_on_failure=Selenium2Library.CapturePageScreenshot

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    # Maximize Browser Window

End Web Test
    Close Browser