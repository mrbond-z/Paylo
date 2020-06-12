*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-check-regis-email}      /merchants/login/email
${api-merchant-login}        /merchants/login  
${api-merchant-me}           /merchants/me      


*** Keywords ***
Check account balance
    [Arguments]          ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=nathakrit.p@gmail.com      
    ...   password=Bb$1234567890

    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}
    ${token}=   Get Json Value    ${resp.text}      /token
    ${token}=   Remove String Using Regexp      ${token}    "
    [Return]     ${token}

    Create Session     get_merchant_id        ${api-staging}
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8      Authorization=${token}
    ${resp}=    GET Request     get_merchant_id     ${api-merchant-me}        headers=${headers}
    ${merchant_id}=   Get Json Value    ${resp.text}      /data/0/id
    ${merchant_id}=   Remove String Using Regexp     ${merchant_id}     "
    [Return]     ${merchant_id}

    Create Session    check_balance     ${api-staging}
    &{headers}=   Create Dictionary     Content-Type=application/json         Authorization=${token}      id=${merchant_id}
    ${resp}=    GET Request     check_balance      /merchants/{merchant_id}/balance         headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

    







         


   


