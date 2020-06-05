*** Settings ***
Resource          ../../../common.robot


*** Keywords ***
Open merchant browser
    Open Browser       ${merchant_url}       chrome
    Maximize Browser Window
    Set Selenium speed   0.5

Merchant login
    [Arguments]           ${merchant-email}        ${merchant-pass}         
    Input text     ${email-field}        ${merchant-email}
    Click element     ${continue-btn} 
    Sleep    2s
    Input text     ${password-xpath}      ${merchant-pass}
    Click element     ${login-btn} 
    Sleep     2s

Verify login success
    [Arguments]          ${merchant-name}
    Element Should Contain        ${verify-login-success}          ${merchant-name}

Merchant login after admin approved account
    [Arguments]           ${email}        ${password}         
    Input text     ${email-xpath}       ${email}
    Click element     ${continue-btn} 
    Sleep    5s
    Input text     ${password-xpath}      ${password}
    Click element     ${login-btn} 
    Sleep     5s




