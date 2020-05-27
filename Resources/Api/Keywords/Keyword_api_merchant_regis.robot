*** Settings ***
Resource     ../../../common.robot
 

*** Variables ***
${api-merchant-regis}            /merchants/register 


*** Keywords ***
Merchant register
    [Arguments]     ${status}      ${message}
    Create Session       register       ${api-staging}        disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     
    &{data}=    Create Dictionary      company_name=BOND Coporation   
    ...  address=Space XX
    ...  business_type=Hotel
    ...  product_type=Room
    ...  name=nathakrit
    ...  contact_email=nathakrit.p@gmail.com
    ...  phone=0998887777
    ...  email=nathakrit.p@gmail.com
    ...  password=Bb$1234567890

    ${resp}=  POST Request    register      ${api-merchant-regis}       data=${data}      headers=${headers}
    Should Be Equal As Strings     ${resp.status_code}      ${status}  
    Should Contain    ${resp.text}   ${message}
    
   




