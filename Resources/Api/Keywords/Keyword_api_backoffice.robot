*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-admin-login}       /admin/login
${api-get-merchant}      /admin/merchants
${api-delete-merchant}         /admin/merchants

*** Keywords ***
Backoffice login to the system    
    [Arguments]          ${status}      
    Create Session      backoffice_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=paylobackoffice@gmail.com      
    ...   password=20Scoops#
    ${resp}=  POST Request  backoffice_login    ${api-admin-login}      data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}

Get merchant registered ID and approve
    [Arguments]     ${status} 
    Create Session      backoffice_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=paylobackoffice@gmail.com      
    ...   password=20Scoops#
    ${resp}=  POST Request  backoffice_login    ${api-admin-login}      data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}
    
    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}    page=1    perpage=1    status=1
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

    Create Session     approve     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}    id=${merchant_id}
    ${resp}=  PUT Request    approve        /admin/merchants/${merchant_id}/approve           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Get merchant registered ID and reject
    [Arguments]     ${status} 
    Create Session      backoffice_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=paylobackoffice@gmail.com      
    ...   password=20Scoops#
    ${resp}=  POST Request  backoffice_login    ${api-admin-login}      data=${data}    headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${token}=  Get Json Value      ${resp.text}       /token
    ${token}=  Remove String Using Regexp  ${token}    "
    [Return]    ${token}

    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}    page=1    perpage=1    status=1
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

    Create Session     reject     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json         Authorization=${token}    
    ${resp}=  PUT Request    reject       /admin/merchants/${merchant_id}/reject           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Delete merchant by ID
    [Arguments]     ${status} 
    #Get token
    Create Session      admin_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=paylobackoffice@gmail.com      
    ...   password=20Scoops#
    ${resp}=  POST Request   admin_login     ${api-admin-login}     data=${data}    headers=${headers}
    ${token}=    Get Json Value     ${resp.text}      /token
    ${token}=    Remove String Using Regexp    ${token}    "
    [Return]    ${token} 
    #Get merchant id
    Create Session     get merchant     ${api-staging}     disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}    page=1    perpage=1    status=1
    
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    ${merchant_id}=  Get Json Value    ${resp.text}    /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  
    #Delete merchant
    Create Session     delete     ${api-staging}     disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}     id=${merchant_id}
    ${resp}=  DELETE Request    delete       /admin/merchants/${merchant_id}           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Delete merchant by email 
    [Arguments]     ${status}         ${email}
    Create Session       delete       ${api-staging}              disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}
    &{data}=    Create Dictionary      email=${email}   

    ${resp}=  DELETE Request    delete      /admin/merchants       data=${data}      headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
