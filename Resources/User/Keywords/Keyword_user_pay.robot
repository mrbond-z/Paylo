*** Settings ***
Resource          ../../../common.robot

*** Keywords ***
Open payment browser
    Open Browser     ${payment_url}        chrome       
    Maximize Browser Window
    Set Selenium speed   0.5
    Sleep     3s

Input amount
    [Arguments]        ${amount}
    Input text    ${amount_xpath}     ${amount}

Input Public Key
    [Arguments]        ${public_key}
    Input text     ${publick_xpath}     ${public_key}

Input Private Key
    [Arguments]        ${private_key}
    Input text     ${privatek_xpath}     ${private_key}

Input name
    [Arguments]        ${name}
    Double Click Element      ${name-xpath}  
    Press Key     ${name-xpath}     \\127 
    Input text     ${name-xpath}     ${name}

Input email
    [Arguments]        ${email}
    Double Click Element      ${email-xpath}     
    Press Key      ${email-xpath}     \\127
    Double Click Element      ${email-xpath}     
    Press Key      ${email-xpath}     \\127
    Double Click Element      ${email-xpath}     
    Press Key      ${email-xpath}     \\127
    Double Click Element      ${email-xpath}     
    Press Key      ${email-xpath}     \\127
    Double Click Element      ${email-xpath}     
    Press Key      ${email-xpath}     \\127
    Input text     ${email-xpath}     ${email}
    
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
    Set Selenium speed    0.5  
    Press Keys     ${cardno_xpath}      555555555555
    Press Keys     ${cardno_xpath}      4444
    Sleep    2s

Input expire date
    Press Keys      ${cardexp_xpath}     \\0222
    
Input CVC
    Press Keys     ${cardcvc_xpath}     \\333       

Click payment button 
    Click element      ${submit_btn}
    Sleep    10s

Wait until payment success
    Location Should Contain         https://pngriver.com/wp-content/uploads/2018/04/Download-Success-PNG-Image.png?

Verify errors
     Wait Until Page Contains Element     ${verify_fail}

Open Stripe browser
     Open Browser      ${stripe_url}      chrome
     Maximize Browser Window
     Set Selenium speed   0.5
     Sleep     8s





