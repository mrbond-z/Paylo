*** Settings ***
Resource          ../../../common.robot



*** Variables ***
${api-check-regis-email}      /merchants/login/email
${api-merchant-login}        /merchants/login


*** Keywords ***
Check email is existing
    [Arguments]     ${merchant_email}      ${status}       ${message}
    Create Session      merchant_login       ${api-staging}
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary    email=${merchant_email}
    ${resp}=  POST Request  merchant_login    ${api-check-regis-email}      data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}      ${status}
    Should Contain    ${resp.text}       ${message}
    

Go to Login Api and send value
    [Arguments]     ${merchant_email}       ${merchant_password}       ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=${merchant_email}      
    ...   password=${merchant_password}

    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}

Verify Login fail
    [Arguments]     ${wrong-email}        ${wrong-password}        ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=${wrong-email}    
    ...   password=${wrong-password} 

    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}


   


