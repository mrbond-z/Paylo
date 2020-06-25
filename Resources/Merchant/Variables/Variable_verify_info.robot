*** Variables ***
#Side menu
${sum-xpath}        //*[@class="indexview__Wrapper-sc-1157pxf-0 foUBSv"]/div/ul/li[1]
${activity-xpath}        //*[@class="indexview__Wrapper-sc-1157pxf-0 foUBSv"]/div/ul/li[2]
${report-xpath}        //*[@class="indexview__Wrapper-sc-1157pxf-0 foUBSv"]/div/ul/li[3]
${setting-xpath}        //*[@class="indexview__Wrapper-sc-1157pxf-0 foUBSv"]/div/ul/li[4]
${qr-xpath}        //*[@class="indexview__Wrapper-sc-1157pxf-0 foUBSv"]/div/ul/li[5]

#Setting page
${profile-xpath}     //*[@class="SubLayout__SidebarWrapper-tjbii-5 iMmwnO"]/ul/li[1]
${payments-xpath}         //*[@class="SubLayout__Wrapper-tjbii-0 cowYMi"]/div/ul/li[2]
${login-cre-xpath}      //*[@class="SubLayout__Wrapper-tjbii-0 cowYMi"]/div/ul/li[3]
${finan-per-xpath}        //*[@class="SubLayout__Wrapper-tjbii-0 cowYMi"]/div/ul/li[4]
${api-key-xpath}           //*[@class="SubLayout__Wrapper-tjbii-0 cowYMi"]/div/ul/li[5]

#Activity page
${payment-status}        //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[2]/div/span
${payment-name}          //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[4]
${price}                 //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[5]/div
${fee}                   //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[6]/div
${Net}                   //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[7]/strong
${cashback}              //*[@class="Table__TableBody-sc-1d7s95x-3 efpxeA"]/tr[2]/td[5]/div
 


#Profile info
${save-btn}       //*[@class="MuiButton-label"]/span
${toast-alert}       //*[@class="MuiAlert-message"]/div/a   
${toast-edit-success}     //*[@class="MuiAlert-message"]/div
${company-field}         //*[@id="signin-form"]/div[2]/div/input
${address-field}         //*[@id="signin-form"]/div[3]/div/input
${biztype-field}         //*[@id="signin-form"]/div[4]/div/input
${producttype-field}         //*[@id="signin-form"]/div[5]/div/input
${contact-field}         //*[@id="signin-form"]/div[6]/div/input
${profile}             //*[@class="indexview__Detail-eq3sj0-4 lofCqk"]/h5
#Values
${companyName}       Dream High
${registeredAddress}      MARS
${businessType}       Capsules Hotel
${contactPerson}       Tom
${email}           nathakrit.p+1@gmail.com
${phone}               123456789
${password}            Bb$1234567890
${wrong-password}      12345678

#Payment info
${field-iban}       id=field-ibanNumber
${field-vatNumber}     id=field-vatNumber
#values
${iban}             DE91 1000 0000 0123 4567 89
${vat}              TT 223232342424


#Verify signup
${signup-success}          //*[@id="root"]/div[1]/div/div/h1
${back-to-home-btn}        //*[@class="indexview__Container-sc-1v4jxrt-2 dKaTzj"]/button

#Logout
${logout}           logout-link
${confirm-logout}     //*[@class="MuiDialog-container MuiDialog-scrollPaper"]/div/div[3]/button[2]