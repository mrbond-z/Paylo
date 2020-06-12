*** Settings ***
Resource     ../../../common.robot
 

*** Variables ***
${api-merchant-cashback}            /merchants​/config   
${api-admin-global-cashback}        /admin/global-configs
${api-admin-config-merchant}        /admin/global-configs/merchants/{id}
${api-admin-login}       /admin/login
${api-get-merchant}            /admin/global-configs/merchants


*** Keywords ***
Admin setting global cashback in percent   
    [Arguments]     ${status}      ${fee}     ${cashback}      ${qrcashback}
    #Get token
    Create Session      admin_login     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary     email=paylobackoffice@gmail.com      
    ...   password=20Scoops#
    ${resp}=  POST Request   admin_login     ${api-admin-login}     data=${data}    headers=${headers}
    ${token}=    Get Json Value     ${resp.text}      /token
    ${token}=    Remove String Using Regexp    ${token}    "
    [Return]    ${token} 
    #Edit % global cashback
    Create Session     edit_cashback      ${api-staging}   
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}
    &{data}=    Create Dictionary      fee_percent=${fee}
    ...   cashback_percent=${cashback}
    ...   qr_cashback_percent=${qrcashback}
    ${resp}=  PUT Request    edit_cashback     ${api-admin-global-cashback}      data=${data}     headers=${headers} 
     Should Be Equal As Strings     ${resp.status_code}      ${status} 

   
Admin setting merchant cashback in percent   
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
    #Get merchant
    Create Session      get_merchant     ${api-staging}       disable_warnings=0
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8    Authorization=${token}     page=1     perpage=1     sort=1     search=1111
    ${resp}=  GET Request   get_merchant     ${api-get-merchant}       headers=${headers}
    ${merchant_id}=    Get Json Value     ${resp.text}      /data/0/id
    ${merchant_id}=    Remove String Using Regexp    ${merchant_id}    "
    [Return]    ${merchant_id}
    #Edit % merchant cashback
    Create Session     edit_cashback      ${api-staging}   
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token}       id=${merchant_id}
    &{data}=    Create Dictionary      fee_percent=10
    ...   cashback_percent=10
    ...   qr_cashback_percent=10
    ${resp}=  PUT Request    edit_cashback     /admin/global-configs/merchants/${merchant_id}      data=${data}     headers=${headers} 
     Should Be Equal As Strings     ${resp.status_code}      ${status} 



