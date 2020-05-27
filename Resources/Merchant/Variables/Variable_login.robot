*** Variables ***

#Url Merchant
${merchant_url}      https://staging.pay-lo.com/merchant/signin

#login form
${email-xpath}       id=field-email
${continue-btn}      id=signin-button
${login-btn}         //*[@class="MuiButton-label"]/span
${password-xpath}     id=field-password


#values
${merchant-email}      paylomerchant1@gmail.com
${merchant-pass}       Paylo_123456

#Verify login 
${verify-login-success}      //*[@class="indexview__Detail-eq3sj0-4 lofCqk"]/h5  
${merchant-name}        Merchants Company 1

${signup}            //*[@class="MuiBox-root jss3022 indexview__Footer-sc-1fdlphj-2 jDUEdy"]//following::div
