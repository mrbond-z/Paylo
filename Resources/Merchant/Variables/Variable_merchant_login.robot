*** Variables ***

#Url Merchant
${merchant_url}      https://staging.pay-lo.com/merchant/signin

#login form
${email-field}       id=field-email
${continue-btn}      id=signin-button
${login-btn}         //*[@class="MuiButton-label"]/span
${password-xpath}     id=field-password


#values
${merchant-email}      nathakrit.p@gmail.com
${merchant-pass}       Bb$1234567890

#Verify login 
${verify-login-success}      //*[@class="indexview__Detail-eq3sj0-4 lofCqk"]/h5  
${merchant-name}        Merchants Company 1


