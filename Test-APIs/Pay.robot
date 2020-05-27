*** Settings ***
Resource    ../common.robot


*** Test Cases ***
01 : User can be able to pay with paylo
    Make a payment             200        
 
02 : Placing payment should be success
    Replacing payment            200       

03 : Create payment
    Create payment        200

04 : Proceed payment
    Pay with credit card     200


