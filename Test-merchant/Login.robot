*** Settings ***
Resource          ../common.robot
Test Setup     Open merchant browser
Test Teardown   close all browsers


*** Test Cases ***
TC01 : Merchant login success
    Merchant login     ${merchant-email}        ${merchant-pass}
    Verify login success        ${merchant-name}