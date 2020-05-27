*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-delete-merchant}         /admin/merchants


*** Keywords ***
Delete merchant
    [Arguments]     ${status}         
    Create Session       delete       ${api-staging}              disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${admin-token}
    &{data}=    Create Dictionary      email=nathakrit.p@gmail.com   

    
    ${resp}=  POST Request    delete      ${api-delete-merchant}       data=${data}      headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}  
    
   




