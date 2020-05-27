*** Settings ***
Resource    ../common.robot


*** Test Cases ***
TC01 : Get merchant ID and Approve merchant.
    Get merchant registered ID and approve        200 

TC02 : Merchant was rejected by Admin.
    Get merchant registered ID and reject       200

TC03 : Merchant was removed by Admin.
    Delete merchant by ID          200
        

 



 