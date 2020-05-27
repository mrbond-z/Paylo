*** Settings ***
Resource    ../common.robot


*** Test Cases ***
LOGIN_01 : System should verify registered email.
    Check email is existing        ${merchant_email}       200          "email is correct"
 

LOGIN_02 : System should verify unregister email.
    Check email is existing        unregister@gmail.com      400         "email is not existed"

LOGIN_03 : Login Success
    Go to Login Api and send value        ${merchant_email}       ${merchant_password}       200  

LOGIN_04 : Verify login fail
    Verify Login fail        ${wrong-email}        ${wrong-password}         400

