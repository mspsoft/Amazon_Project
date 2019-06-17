*** Settings ***
Documentation    Suite description
Library  JSONLibrary
Library   AppiumLibrary  #run_on_failure=Selenium2Library.CapturePageScreenshot
Library  ../Config/DeviceCapabilities.py

*** Variables ***
#${REMOTE_URL}             http://localhost:4723/wd/hub
#${PLATFORM_NAME_ANDROID}  Android
#${PLATFORM_VERSION}       7.1.1
#${DEVICE_NAME_ANDROID}    localhost:5555
#${APP_ANDROID}            C:/Users/patilma/Downloads/Amazon Shopping_v18.11.0.100_apkpure.com.apk
#${AUTOMATION_NAME}        UiAutomator2
#${APP_PACKAGE_NAME}       in.amazon.mShop.android.shopping
#${APP_ACTIVITY_NAME}      com.amazon.mShop.splashscreen.StartupActivity

*** Keywords ***
Open mobile app
#    Open Application    ${REMOTE_URL}  platformName=${PLATFORM_NAME_ANDROID}    deviceName=${DEVICE_NAME_ANDROID}
#    ...                 automationName=${AUTOMATION_NAME}  appPackage=${APP_PACKAGE_NAME}  appActivity=${APP_ACTIVITY_NAME}

#    Open Application    ${REMOTE_URL}  platformName=${PLATFORM_NAME_ANDROID}  platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE_NAME_ANDROID}
#    ...                 automationName=${AUTOMATION_NAME}  appPackage=${APP_PACKAGE_NAME}  appActivity=${APP_ACTIVITY_NAME}

    ${devCap} =  get library instance  DeviceCapabilities
    Open Application    ${devCap.remoteUrl}  platformName=${devCap.platformName}  platformVersion=${devCap.platformVersion}  deviceName=${devCap.deviceName}
    ...                 automationName=${devCap.automationName}  appPackage=${devCap.appPackage}  appActivity=${devCap.appActivity}

Close mobile app
    Close All Applications