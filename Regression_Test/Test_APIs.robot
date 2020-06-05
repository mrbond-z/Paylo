*** Settings ***
Resource     ../common.robot

*** Test Case ***
TC01 : Merchant register success.
    Merchant register     200     ${email-delete}      success register merchant.  

TC02 : Backoffice can reject merchant.
    Get merchant registered ID and reject     200 

TC03 : Backoffice can approve merchant.
    Get merchant registered ID and approve     200

TC04 : Merchant can be able to login.
    Go to Login Api and send value             200

TC05 : Merchant was deleted by admin 
    Delete merchant by email     200         ${email-delete}