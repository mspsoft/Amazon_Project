*** Settings ***
Library   AppiumLibrary  #run_on_failure=Selenium2Library.CapturePageScreenshot
Resource  ./LoginPage.robot
Resource  ../Keywords/CommonKeyword.robot

# Command - robot -d Results -A TestSuite/Config/config.args TestSuite/Mobile/FirstRobotFile.robot
*** Variables ***
#${REMOTE_URL}     http://localhost:4723/wd/hub
#${PLATFORM_NAME_ANDROID}    Android
#${DEVICE_NAME_ANDROID}    Pemulator-5554
##${APP_ANDROID}    ${CURDIR}${/}app${/}com.amazon.mShop.android.shopping_2019-05-28.apk
#${APP_ANDROID}    C:/Users/patilma/Downloads/Amazon Shopping_v18.11.0.100_apkpure.com.apk
#${AUTOMATION_NAME}    UiAutomator2

*** Test Cases ***
#*** Keywords ***
Verify on mobile app
    Open mobile app
    Sign In into mobile app
    Close All Applications