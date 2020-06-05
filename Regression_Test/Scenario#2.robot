*** Settings ***
Resource    ../common.robot
Test Teardown    close all browsers


*** Test Cases ***
TC01 : User can be able to pay with paylo
    Open payment browser
    Input amount          ${amount}
    Input Public Key      ${public_key}
    Input Private Key     ${private_key}
    Input name            ${name}
    #Input email           ${email}
    Input Success URL     ${success_url}
    Input Fail URL        ${fail_url}
    Input Back URL        ${back_url}
    Click submit button  
    Click pay with credit card
    Verify payment with creditcard form
    Input credit card number   
    Input expire date
    Input CVC 
    Click payment button
    Wait until payment success

TC02 : Merchant verify payment success.
    Open merchant browser      
    Merchant login      ${merchant-email}        ${merchant-pass}
    Check activity transactions


