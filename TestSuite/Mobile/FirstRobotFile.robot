*** Settings ***
Resource  ./Keywords/CommonKeywords.robot
Resource  ./PO/LoginPage.robot

# Command - robot -d Results -A TestSuite/Mobile/Configuration/config.args TestSuite/Mobile/FirstRobotFile.robot
#*** Test Cases ***
*** Keywords ***
Verify on Mobile app
    Open mobile app
    Sign In into mobile app
    Close mobile app