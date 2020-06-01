*** Settings ***
Resource          ../../../common.robot


*** Keywords ***
Open backoffice browser
    Open Browser       ${backoffice_url}       chrome
    Maximize Browser Window
    Set Selenium speed   0.5

Backoffice login
    [Arguments]           ${backoffice-email}        ${backoffice-pass}        
    Input text     ${email-xpath}       ${backoffice-email}
    Click element     ${continue-btn} 
    Sleep    2s
    Input text     ${password-xpath}      ${backoffice-pass}
    Click element     ${login-btn} 
    Sleep     2s

Verify backoffice login success
    [Arguments]          ${backoffice-name} 
    Element Should Contain        ${verify-backoffice-login}           ${backoffice-name}  

Approve merchant
    [Arguments]         ${modal-header-text}
    Click element     ${merchant-menu}     
    Wait Until Element Is Visible    ${approve-btn}
    Click element     ${approve-btn}
    Sleep     5s
    Element Should Contain    ${verify-modal}     ${modal-header-text}
    Click element     ${confirm-btn} 
    Sleep     3s
    Wait Until Element Is Visible    ${verify-approve}   
       
Verify approve success
    [Arguments]          ${status-approved}
    Element Should Contain        ${verify-approve}          ${status-approved}  





