*** Settings ***
Resource     ../common.robot
# Test Teardown    close all browsers


*** Test Case ***
TC01 : Merchant can be able to register.
    Go to merchant register
    Merchant register step 1         ${companyName}       ${registeredAddress}       ${businessType} 
    Merchant register step 2         ${contactPerson}     ${email}      ${phone}
    Merchant register step 3         np@gmail.com      ${password}
    Verify signup success
    Close all browsers

TC02 : Backoffice approve merchant successful.
    Open backoffice browser
    Backoffice login      ${backoffice-email}        ${backoffice-pass}
    #Verify backoffice login success    ${backoffice-name}
    Approve merchant        ${modal-header-text}
    Verify approve success     ${status-approved} 
    Close all browsers

TC03 : Merchant login with valid account successful.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Verify login success       ${companyName}      
    Verify toast update payment is appear 
    Close all browsers      

TC04 : Merchant can be able to update their payment information.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Verify merchant information    ${companyName}    ${registeredAddress}    ${businessType}    ${contactPerson}
    Close all browsers

TC05 : Toast should not appear if merchant updated payment information.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Update payment information     ${iban}     ${vat}    
    Merchant logout    
    Merchant login         np@gmail.com     ${password}
    Verify toast disappear
    Close all browsers

    

# TC05 : Merchant verify their information.

# TC06 : Merchant generate APIs payment key.


    