*** Settings ***
Resource          ../../../common.robot


*** Keywords ***
Go to merchant register 
    Open Browser     ${url-merchant-register}       chrome
    Maximize Browser Window
    Set Selenium speed   0.5

Merchant register step 1
    [Arguments]     ${companyName}      ${registeredAddress}     ${businessType}                            
    Input text        ${field-companyName}             ${companyName} 
    Input text        ${field-registeredAddress}       ${registeredAddress}
    Input text        ${field-businessType}        ${businessType}
    Click element      ${continue-step2-btn}
    Sleep    2s

Merchant register step 2
    [Arguments]     ${contactPerson}     ${contactEmail}      ${phone}
    Input text     ${field-contactPerson}      ${contactPerson}
    Input text     ${field-contactEmail}      ${contactEmail} 
    Input text     ${field-phone}           ${phone}
    Click element     ${continue-step3-btn}
    Sleep     2s

Merchant register step 3
    [Arguments]       ${contactEmail}      ${password} 
    Input text     ${field-emailAddress}         ${contactEmail} 
    Input text     ${field-password}         ${password} 
    Sleep     2s
    Click element      ${signup-btn} 
    Sleep     4s

Verify signup success
    [Arguments]          
    #Element Should Contain        ${signup-success}           Registration Request Sent 
    Click element         ${back-to-home-btn}



