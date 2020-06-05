*** Settings ***
Resource          ../../../common.robot


*** Keywords ***
Check activity transactions
    Click element       ${activity-xpath}
    Wait Until Element Is Visible          ${payment-status}
    Element Should Contain       ${payment-status}      Succeeded
    Element Should Contain       ${payment-name}        BOND  
    Element Should Contain       ${price}          100.00 EUR
    Element Should Contain       ${fee}            -5.00 EUR
    Element Should Contain       ${Net}            95.00 EUR   
    Element Should Contain       ${cashback}       -10.00 EUR

    