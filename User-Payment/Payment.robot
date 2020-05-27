*** Settings ***
Resource          ../common.robot
Test Setup    Open payment browser
Test Teardown   close all browsers

*** Test Cases ***
TC01 Pay with Paylo should be success.
     Input amount          ${amount}
     Input Public Key      ${public_key}
     Input Private Key     ${private_key}
     Input Success URL     ${success_url}
     Input Fail URL        ${fail_url}
     Input Back URL        ${back_url}
     Click submit button  
     Click pay with credit card
     Click payment button
     Verify errors




     

   
    