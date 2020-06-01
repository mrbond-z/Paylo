*** Settings ***
Resource          ../../../common.robot

*** Keywords ***
Open payment browser
    Open Browser       https://staging-pay.pay-lo.com/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiakEyWm1NMiIsImV4cCI6MTU5MDc2ODgzMCwiaWF0IjoxNTkwNjgyNDMwfQ.KUZOp7gKWw2oU_U7SvlEjpZHdX2STClCDIvDzc84NyA/creditcard      chrome       #${payment_url}
    Maximize Browser Window
    Set Selenium speed   0.5
    Sleep     8s

Input amount
    [Arguments]        ${amount}
    Input text    ${amount_xpath}     ${amount}

Input Public Key
    [Arguments]        ${public_key}
    Input text     ${publick_xpath}     ${public_key}

Input Private Key
    [Arguments]        ${private_key}
    Input text     ${privatek_xpath}     ${private_key}
    
Input Success URL
    [Arguments]        ${success_url}
    Input text     ${success_url_xpath}      ${success_url}

Input Fail URL
    [Arguments]        ${fail_url}
    Input text     ${fail_url_xpath}      ${fail_url}

Input Back URL
    [Arguments]        ${back_url}
    Input text     ${back_url_xpath}      ${back_url}
    Sleep    3s

Click submit button
    Click element      ${pay_button} 
    Sleep    5s

Click pay with credit card
    Click element      ${credit_button}        
    # Wait Until Element Contains        ${cardno_xpath}
    Sleep    5s

Verify payment with creditcard form
    Element Should Contain      ${verify_credit_form}      Credit Card

Input credit card number     
    Click element    ${cardno_xpath} 
    Sleep    3s
    Input text     ${cardno_xpath}         4242 4242 4242 4242

Input expire date
    Input text     ${cardexp_xpath}        02/22  
    Set Selenium speed   0.5

Input CVC
    Input text     ${cardcvc_xpath}        333  

Click payment button 
    Click element      ${submit_btn}
    Sleep    7s

Verify errors
     Wait Until Page Contains Element     ${verify_fail}

Open Stripe browser
     Open Browser      ${stripe_url}      chrome
     Maximize Browser Window
     Set Selenium speed   0.5
     Sleep     8s





