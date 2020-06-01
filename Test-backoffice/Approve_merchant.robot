*** Settings ***
Resource        ../common.robot
Test Setup     Open backoffice browser
Test Teardown   close all browsers

*** Test Cases ***
TC01 : Backoffice approve merchant successful.
    Backoffice login      ${backoffice-email}        ${backoffice-pass}
    Verify backoffice login success    ${backoffice-name}
    Approve merchant        ${modal-header-text}
    Verify approve success     ${status-approved}  
