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

TC05 : Merchant was deleted by admin. 
    Delete merchant by ID       200         

TC06 : Generate QR code.
    Merchant login and get token        200

TC06 : Get QR List information.
    Get QR code      200

TC07 : Delete QR code.
    Delete qr code     200

TC08 : Backoffice setting global cashback for all merchants.
    Admin setting global cashback in percent     200       10     10     10    
    Admin setting global cashback in percent     200       5     100     5          #reset value back 

TC09 : Backoffice setting specific merchant cashback.
    Admin setting merchant cashback in percent     200
