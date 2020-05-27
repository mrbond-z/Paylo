*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-get-merchant}      /admin/merchants

*** Keywords ***
Get merchant registered ID
    [Arguments]     ${status} 
    Create Session     get merchant     ${api-staging}     disable_warnings=1
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}    page=1    perpage=1    status=1
    
    ${resp}=  GET Request    get merchant      ${api-get-merchant}            headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status} 
    ${merchant_id}=  Get Json Value  ${resp.text}  /data/0/id
    ${merchant_id}=  Remove String Using Regexp  ${merchant_id}  "
    [Return]  ${merchant_id}  

