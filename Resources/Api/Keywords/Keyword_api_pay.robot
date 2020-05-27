*** Settings ***
Resource          ../../../common.robot

*** Variables ***
${api-pay}                  /v1/payment/request
${api-replace-payment}      /v1/placing-payments
${token}       eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkM0UxWkRkcCIsImV4cCI6MTU5MDIwNDgyMSwiaWF0IjoxNTkwMTE4NDIxfQ.JH0AfM9Cx4zD_Ede2SPArfspPjxagr-UXB6Q7vztZ9g
${create-payment}           /v1/payments/stripe/create
${stripe-payment-url}       https://m.stripe.com


*** Keywords ***
Make a payment
    [Arguments]     ${status}     
    Create Session      payment     ${url-payment}
    &{headers}=   Create Dictionary     Content-Type=application/json     charset=utf-8
    &{data}=    Create Dictionary    
    ...   pbkey= 930d99005c6b421c8657a609b92ef550
    ...   pvkey= 8e02141a530a38c3647777ca1678a29f6f915e4951744fc80b78f39ff18cdef4
    ...   name= bond
    ...   email= nathakrit.p@gmail.com
    ...   amount= 100
    ...   success_url= https://pngriver.com/wp-content/uploads/2018/04/Download-Success-PNG-Image.png
    ...   fail_url= https://img.pngio.com/fail-png-97-images-in-collection-page-1-failure-png-660_320.png
    ...   back_url= https://image.flaticon.com/icons/svg/0/340.svg

    ${resp}=  POST Request  payment     ${api-pay}     data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}      ${status}  
    

Replacing payment
    [Arguments]     ${status} 
    Create Session     replacing payment     ${url-payment}
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token} 
    ${resp}=    Get Request    replacing payment    ${api-replace-payment}
    Should Be Equal As Strings    ${resp.status_code}      ${status} 

Create payment
    [Arguments]     ${status} 
    Create Session     create payment      ${url-payment}
    &{headers}=   Create Dictionary     Content-Type=application/json        Authorization=${token} 
    ${resp}=    Post Request     create payment     ${create-payment}
    Should Be Equal As Strings    ${resp.status_code}      ${status} 

Pay with credit card
    [Arguments]     ${status}
    Create Session     proceed payment      ${stripe-payment-url}
    &{headers}=   Create Dictionary     Content-Type=text/plain        charset=utf-8  
    &{data}=     Create Dictionary 
    ...   card_number= 4242 4242 4242 4242
    ...   expiry_date= 02 / 22
    ...   cvc= 333
    ${resp}=    Post Request     proceed payment     /4
    Should Be Equal As Strings    ${resp.status_code}      ${status}


