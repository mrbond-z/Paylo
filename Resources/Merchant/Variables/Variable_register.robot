*** Variables ***
#Xpath
${url-merchant-register}          https://staging.pay-lo.com/registration
${signup}             //*[@class="MuiBox-root jss3022 indexview__Footer-sc-1fdlphj-2 jDUEdy"]//following::div
${field-companyName}     id=field-companyName
${field-registeredAddress}     id=field-registeredAddress
${field-businessType}     id=field-businessType
${continue-step2-btn}     //*[@class="indexview__WrapperBtn-fy6qwq-0 cKmeet"]/button
${field-contactPerson}     id=field-contactPerson
${field-contactEmail}     id=field-contactEmail   
${field-phone}            id=field-phone
${continue-step3-btn}          //*[@class="indexview__WrapperBtn-fy6qwq-0 cKmeet"]/button
${field-emailAddress}      id=field-emailAddress
${field-password}          id=field-password
${signup-btn}               //*[@class="indexview__WrapperBtn-fy6qwq-0 cKmeet"]/button





#Values
${companyName}       Bond Corporation Co., Ltd.
${registeredAddress}      Space
${businessType}     9 Stars Hotel
${contactPerson}       Tom
${contactEmail}        nathakrit.p@gmail.com
${phone}               123456789
${password}            Bb$1234567890
${wrong-password}      12345678

#Verify signup
${signup-success}          //*[@id="root"]/div[1]/div/div/h1
${back-to-home-btn}        //*[@class="indexview__Container-sc-1v4jxrt-2 dKaTzj"]/button