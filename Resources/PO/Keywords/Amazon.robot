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


Login Into Amazon
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
    sleep  10s


Verify Login Successful
    #Wait Until Page Contains  ${SignSuccessText_Loc}
    Element Should Contain  ${SignSuccessText_Loc}  ${SuccessTextMessage}
    Capture Page Screenshot
    log to console  Login successful

Search Amazon
    Input Text  ${SearchText_Loc}  ${SearchText}
    Click Element  ${SearchGoButton_Loc}
    Capture Page Screenshot
    log to console  search amazon
Select Product
    Click Element  ${Product1_Loc}
    Capture Page Screenshot
    log to console  select product
Add To Cart1
    Click Element  ${AddToCart_Loc}
    Capture Page Screenshot
    log to console  add to cart

Logout from Application
    Click Element  ${logout_loc}
    log to console  logout
