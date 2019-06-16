*** Variables ***
${btn_AlreadyACustomer}  xpath=//android.widget.Button[@resource-id='in.amazon.mShop.android.shopping:id/sign_in_button']
${btn_CreateAnAccount}  xpath=//android.widget.Button[@resource-id='in.amazon.mShop.android.shopping:id/new_user']
${btn_SkipSignIn}  xpath=//android.widget.Button[@resource-id='in.amazon.mShop.android.shopping:id/skip_sign_in_button']

${lbl_WelcomeMsg}  xpath=//android.view.View[@text='Welcome']
${radio_Login}  xpath=//android.view.View[@resource-id='login_accordion_header']
${radio_CreateAccount}  xpath=//android.view.View[@resource-id='register_accordion_header']
${txtbx_LoginEmail}  xpath=//android.widget.EditText[@resource-id='ap_email_login']
${btn_Continue}  xpath=//android.widget.Button[@resource-id='continue']

${lbl_LoginWelcomeMsg}  xpath=//android.view.View[@text='Login']
#${lbl_LoginEmail}  xpath=//android.widget.Button[@resource-id='signInSubmit']
#${lnk_Change}  xpath=//android.widget.Button[@resource-id='signInSubmit']
${txtbx_LoginPassword}  xpath=//android.widget.EditText[@resource-id='ap_password']
${btn_Login}  xpath=//android.widget.Button[@resource-id='signInSubmit']

${emailID}  mspsoft@gmail.com
${password}  Autothon1

*** Keywords ***
Sign In
    Wait Until Element Is Visible  ${btn_AlreadyACustomer}
    click element  ${btn_AlreadyACustomer}
    Wait Until Element Is Visible  ${radio_Login}
    Element Should Contain Text  ${lbl_WelcomeMsg}  Welcome
    click element  ${radio_Login}
    Input Text  ${txtbx_LoginEmail}  ${emailID}
    click element  ${btn_Continue}
    Wait Until Element Is Visible  ${txtbx_LoginPassword}
    Element Should Contain Text  ${lbl_LoginWelcomeMsg}  Login
#    Element Should Contain Text  ${lbl_LoginEmail}  mspsoft@gmail.com
    Input Password  ${txtbx_LoginPassword}  ${password}
    click element  ${btn_Login}

Second keyword
    Do more
