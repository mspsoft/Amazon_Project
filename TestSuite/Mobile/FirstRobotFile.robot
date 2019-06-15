*** Settings ***

Library           AppiumLibrary  run_on_failure=Selenium2Library.CapturePageScreenshot
Resource  ./LoginPage.robot
*** Variables ***

${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME_ANDROID}    Android
${DEVICE_NAME_ANDROID}    Pemulator-5554
#${APP_ANDROID}    ${CURDIR}${/}app${/}com.amazon.mShop.android.shopping_2019-05-28.apk
${APP_ANDROID}    C:/Users/patilma/Downloads/Amazon Shopping_v18.11.0.100_apkpure.com.apk
${AUTOMATION_NAME}    UiAutomator2



#*** Test Cases ***
*** Keywords ***
Open Android app

    Open Application    ${REMOTE_URL}  platformName=${PLATFORM_NAME_ANDROID}  platformVersion=7.1.1  deviceName=ZY322CDPWZ
    ...                 automationName=${AUTOMATION_NAME}  appPackage=in.amazon.mShop.android.shopping  appActivity=com.amazon.mShop.splashscreen.StartupActivity
#      appPackage=com.android.browser
    capture page screenshot
    Sign In
    sleep  4s
    capture page screenshot
#    AppiumLibrary.Click Element    //android.widget.TextView[@text='Preference']
#
#    AppiumLibrary.Click Element    //android.widget.TextView[@text='3. Preference dependencies']

    Close All Applications