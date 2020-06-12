*** Settings ***
Resource          ../../../common.robot


*** Keywords ***
Verify merchant information
    [Arguments]      ${companyName}     ${registeredAddress}     ${businessType}     ${contactPerson}
    Click element     ${setting-xpath}
    Click element     ${profile-xpath}
    Element Should Contain      ${profile-xpath}       Tom
    # Element Should Contain      ${field-companyName}      ${companyName} 
    # Element Should Contain      ${field-registeredAddress}     ${registeredAddress}
    # Element Should Contain      ${field-businessType}         ${businessType}
    # Element Should Contain      ${field-contactPerson}         ${contactPerson}

Edit information 
    Click element     ${setting-xpath}
    Click element     ${field-companyName}
    Press Keys         ${field-companyName}    \\127     #(del to delete the text)
    Input text        ${field-companyName}      *Test update field*
    Click element      ${save-btn}
    Element Should Be Visible      ${toast-edit-success}         Success! 
    Sleep     5s
    Reload Page  
    Click element     ${field-companyName}
    Press Keys         ${field-companyName}    \\127     #(del to delete the text)
    Input text        ${field-companyName}     ${companyName}
    Click element      ${save-btn}

Update payment information  
    [Arguments]      ${iban}     ${vat}
    Click element      ${setting-xpath}
    Click element      ${payments-xpath}
    Input text       ${field-iban}      ${iban}
    Input text       ${field-vatNumber}      ${vat}      
    Click element      ${save-btn}
    Sleep     3s
    

Merchant logout 
    Click element     ${logout}
    Click element     ${confirm-logout}
    sleep    3s

Verify toast update payment is appear
    Element Should Contain       ${toast-alert}           Payment Information

Verify toast disappear 
    Element Should Not Be Visible       ${toast-alert}      





