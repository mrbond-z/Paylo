*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-get-merchant}      /admin/merchants
${api-approve}           /admin/merchants/${merchant_id}/approve
${api-reject}            /admin/merchants/${merchant_id}/reject
${api-delete-merchant}         /admin/merchants

*** Keywords ***
Get merchant registered ID and approve
    [Arguments]     ${status} 
    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    page=1    perpage=1    status=1
    
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

    Create Session     approve     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    id=${merchant_id}
    ${resp}=  PUT Request    approve        /admin/merchants/${merchant_id}/approve           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Get merchant registered ID and reject
    [Arguments]     ${status} 
    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    page=1    perpage=1    status=1
    
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

    Create Session     reject     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    id=${merchant_id}
    ${resp}=  PUT Request    reject       /admin/merchants/${merchant_id}/reject           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Delete merchant by ID
    [Arguments]     ${status} 
    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    page=1    perpage=1    status=1
    
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

    Create Session     delete     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    id=${merchant_id}
    ${resp}=  DELETE Request    delete       /admin/merchants/${merchant_id}           headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 

Delete merchant by email 
    [Arguments]     ${status}         
    Create Session       delete       ${api-staging}              disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}
    &{data}=    Create Dictionary      email=nathakrit.p@gmail.com   

    
    ${resp}=  DELETE Request    delete      /admin/merchants       data=${data}      headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
