*** Variables ***
${btn_AlreadyACustomer}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ViewAnimator/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[1]
${btn_CreateAnAccount}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ViewAnimator/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]
${btn_SkipSignIn}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ViewAnimator/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[3]

${lbl_WelcomeMsg}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[1]
${radio_Login}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.widget.RadioButton/android.view.View
${radio_CreateAccount}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.widget.RadioButton/android.view.View
${txtbx_LoginEmail}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText
${btn_Continue}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View/android.view.View[5]/android.view.View/android.widget.Button

${lbl_LoginWelcomeMsg}  xpath=//android.view.View[@text='Login']
#${lbl_LoginEmail}  xpath=//android.widget.Button[@resource-id='signInSubmit']
#${lnk_Change}  xpath=//android.widget.Button[@resource-id='signInSubmit']
${txtbx_LoginPassword}  xpath=//android.widget.EditText[@resource-id='ap_password']
${btn_Login}  xpath=//android.widget.Button[@resource-id='signInSubmit']

*** Keywords ***
Sign In
    Wait Until Element Is Visible  ${btn_AlreadyACustomer}
    click element  ${btn_AlreadyACustomer}
    Wait Until Element Is Visible  ${radio_Login}
    Element Should Contain Text  ${lbl_WelcomeMsg}  Welcome
    click element  ${radio_Login}
    Input Text  ${txtbx_LoginEmail}  mspsoft@gmail.com
    click element  ${btn_Continue}
    Wait Until Element Is Visible  ${txtbx_LoginPassword}
    Element Should Contain Text  ${lbl_LoginWelcomeMsg}  Login
#    Element Should Contain Text  ${lbl_LoginEmail}  mspsoft@gmail.com
    Input Password  ${txtbx_LoginPassword}  Autothon1
    click element  ${btn_Login}

Second keyword
    Do more
