*** Variables ***
${UserName_Loc}  xpath=//*[@id="ap_email"]
${LoginContinueButton_Loc}  xpath=//*[@id="continue"]
${Password_Loc}  xpath=//*[@id="ap_password"]
${SingnInLink_loc}  xpath=//*[@id="nav-link-accountList"]/span[1]
${LoginButton_loc}  css=#signInSubmit
${SignSuccessText_Loc}  xpath=//*[@id="nav-link-accountList"]/span[1]
${SearchText_Loc}  xpath=//*[@id="twotabsearchtextbox"]
${SearchGoButton_Loc}  xpath=//*[@id="nav-search"]/form/div[2]/div/input
${Logout_Loc}  xpath=//*[@id="nav-item-signout"]/span
#Need to remove the hard coding------------------------------------------------------
${Product1_Loc}  xpath=//*[@id="search"]//span[contains(text(),'Dell 5480 AD/Backlit KB Clear Screen')]
${Product2_Loc}  xpath=//*[@id="search"]//span[contains(text(),'Google Pixel 3 (Just Black, 4GB RAM, 64GB Storage')]
${AddToCart_Loc}  xpath =//*[@id="add-to-cart-button"]
#${UserName}  sanjeevsinghverma@gmail.com
${UserName}  mspsoft@gmail.com
#${Password}  Password~1234
${Password}  Autothon1
${SuccessTextMessage}  Hello,
${SearchText}  dell 5480 AD

*** Keywords ***


User login into application with UserName and Password
    #Click on sign in link
    Click Element  ${SingnInLink_loc}
    #Enter loginin username
    Clear Element Text  ${UserName_Loc}
    Input Text  ${UserName_Loc}  ${UserName}
    #Click on cntinue button
    ${cont_status} =  run keyword and return status  Element Should Be Visible  ${LoginContinueButton_Loc}
    run keyword if  '${cont_status}' == 'True'  Click Button  ${LoginContinueButton_Loc}
    ...         ELSE  LOG  "continue button did not appear"
    #Enter Password
    Input Text  ${Password_Loc}  ${Password}
    #click on login ${loginbutton}
    Click Element  ${LoginButton_loc}
    Capture Page Screenshot
    sleep  5s


Verify user has successfully logged into the application
    #Wait Until Page Contains  ${SignSuccessText_Loc}
    Element Should Contain  ${SignSuccessText_Loc}  ${SuccessTextMessage}
    Capture Page Screenshot
    log to console  Login successful

Search for the desired product using ProductName
    Input Text  ${SearchText_Loc}  ${SearchText}
    Click Element  ${SearchGoButton_Loc}
    Capture Page Screenshot
    log to console  search amazon
Select the desired product from the list
    [Arguments]  ${Prod_Name}
    ${str3} =   Catenate    SEPARATOR=  xpath=//*[@id="search"]//span[contains(text(),'   ${Prod_Name}  ')]
    Click Element  ${str3}
    sleep  5s
    Select Window  NEW
    Capture Page Screenshot
    log to console  select product
Add the desired product into your shopping cart
    Click Element  ${AddToCart_Loc}
    Capture Page Screenshot
    log to console  add to cart

Logout from Application
    Mouse Over  ${SignSuccessText_Loc}
    Click Element  ${logout_loc}
    log to console  logout

