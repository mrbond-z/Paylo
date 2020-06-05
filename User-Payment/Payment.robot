*** Settings ***
Resource          ../common.robot
Test Setup    Open payment browser
Test Teardown   close all browsers

*** Test Cases ***
TC01 : Verify payment error.
     Input amount          ${amount}
     Input Public Key      ${public_key}
     Input Private Key     ${private_key}
     Input Success URL     ${success_url}
     Input Fail URL        ${fail_url}
     Input Back URL        ${back_url}
     Click submit button  
     Click pay with credit card
     Verify payment with creditcard form 
     Click payment button
     Verify errors

TC02 : Pay success
     Input amount          ${amount}
     Input Public Key      ${public_key}
     Input Private Key     ${private_key}
     Input name            ${name}
     Input email           ${email}
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
     






     

   
    