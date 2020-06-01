*** Variables ***
#Xpath
${signup}            //*[@class="MuiContainer-root indexview__MuiContainer-sc-1fdlphj-1 bFTCdu MuiContainer-maxWidthLg"]/div[2]/a[2]
${field-companyName}      id=field-companyName
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
${companyName}       Dream High
${registeredAddress}      MARS
${businessType}       Capsules Hotel
${contactPerson}       Tom
${email}             np@gmail.com
${phone}               123456789
${password}            Bb$1234567890
${wrong-password}      12345678


#Verify signup
${signup-success}          //*[@id="root"]/div[1]/div/div/h1
${back-to-home-btn}        //*[@class="indexview__Container-sc-1v4jxrt-2 dKaTzj"]/button