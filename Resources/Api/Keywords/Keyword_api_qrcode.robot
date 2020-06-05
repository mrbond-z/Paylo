*** Settings ***
Resource          ../../../common.robot



*** Variables ***
${api-merchant-login}     /merchants/login
${api-qrcode}      /qr-stands
           


*** Keywords ***
Merchant login and get token
    [Arguments]          ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=nathakrit.p@gmail.com      
    ...   password=Bb$1234567890
    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}
    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}

    Create Session     get_qrcode     ${api-staging}     
    ${headers}=   Create Dictionary        Content-Type=application/json      Authorization=${token}     charset=utf-8
    &{data}=    Create Dictionary     name=Test create qr via api
    ...    description=Test api create qr
    ${resp}=   Post Request    get_qrcode     ${api-qrcode}      data=${data}    headers=${headers} 
    Should Be Equal As Strings     ${resp.status_code}      ${status}

Get QR code    
    [Arguments]          ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=nathakrit.p@gmail.com      
    ...   password=Bb$1234567890
    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}
    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}

    Create Session     get_qrcode     ${api-staging}     
    ${headers}=   Create Dictionary        Content-Type=application/json      Authorization=${token}     page=1    perpage=1    
    ${resp}=   Get Request    get_qrcode     ${api-qrcode}        headers=${headers} 
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${qr_id}=  Get Json Value    ${resp.text}    /data/0/id
    ${qr_id}=  Remove String Using Regexp    ${qr_id}   "
    [Return]    ${qr_id}  

Delete qr code
    [Arguments]          ${status}      
    Create Session      merchant_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=nathakrit.p@gmail.com      
    ...   password=Bb$1234567890
    ${resp}=  POST Request  merchant_login    ${api-merchant-login}     data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}
    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}

    Create Session     get_qrcode     ${api-staging}     
    ${headers}=   Create Dictionary        Content-Type=application/json      Authorization=${token}     page=1    perpage=1    
    ${resp}=   Get Request    get_qrcode     ${api-qrcode}        headers=${headers} 
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${qr_id}=  Get Json Value    ${resp.text}    /data/0/id
    ${qr_id}=  Remove String Using Regexp    ${qr_id}   "
    [Return]    ${qr_id}

    Create Session     delete_qrcode     ${api-staging}
     ${headers}=   Create Dictionary        Content-Type=application/json      Authorization=${token}      id=${qr_id}
     ${resp}=   DELETE Request    delete_qrcode     /qr-stands/${qr_id}        headers=${headers}
     Should Be Equal As Strings     ${resp.status_code}      ${status}




    




   


