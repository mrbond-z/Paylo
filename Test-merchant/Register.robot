*** Settings ***
Resource          ../common.robot
Test Setup      Go to merchant register 
Test Teardown   close all browsers


*** Test Cases ***
TC01 : Merchant register successful.
    Merchant register step 1         ${companyName}      ${registeredAddress}     ${businessType} 
    Merchant register step 2         ${contactPerson}     ${contactEmail}      ${phone}
    Merchant register step 3         ${contactEmail}      ${password}
    Verify signup success