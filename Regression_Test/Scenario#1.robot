*** Settings ***
Resource     ../common.robot
#Test Setup     Open Browser      blank      gc 
Test Teardown    close all browsers


*** Test Case ***
TC01 : Merchant can be able to register.
    Go to merchant register
    Merchant register step 1         ${companyName}       ${registeredAddress}       ${businessType} 
    Merchant register step 2         ${contactPerson}     ${email}      ${phone}
    Merchant register step 3         np@gmail.com      ${password}
    Verify signup success

TC02 : Backoffice approve merchant successful.
    Open backoffice browser
    Backoffice login      ${backoffice-email}        ${backoffice-pass}
    Verify backoffice login success    ${backoffice-name}
    Approve merchant        ${modal-header-text}
    Verify approve success     ${status-approved} 

TC03 : Merchant login with valid account successful.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Verify login success       ${contactPerson}     
    Verify toast update payment is appear       

TC04 : Merchant need to update their payment information.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Verify merchant information    ${companyName}    ${registeredAddress}    ${businessType}    ${contactPerson}
    Edit information 

TC05 : Toast should not appear if merchant updated payment information.
    Open merchant browser
    Merchant login after admin approved account      np@gmail.com     ${password}
    Update payment information     ${iban}     ${vat}    
    Merchant logout    
    Merchant login         np@gmail.com     ${password}
    Verify toast disappear
    

# TC05 : Merchant verify their information.

# TC06 : Merchant generate APIs payment key.

# TC07 : Delete merchant.

    