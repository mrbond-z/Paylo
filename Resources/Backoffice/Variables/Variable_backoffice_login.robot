*** Variables ***

#Url Merchant
${backoffice_url}      https://staging.pay-lo.com/backoffice/signin

#login form
# ${email-xpath}       id=field-email
# ${continue-btn}      id=signin-button
# ${login-btn}         //*[@class="MuiButton-label"]/span
# ${password-xpath}     id=field-password


#values
${backoffice-email}      paylobackoffice@gmail.com
${backoffice-pass}       20Scoops#

#Verify login 
${verify-backoffice-login}       //*[@id="root"]/main/div[1]/aside/div[2]/div/div/div[2]/div/div[2]/h5
${backoffice-name}        Paylo Backoffice

#Dashboard
${merchant-menu}         //*[@id="merchants-link"]/span

#Merchant page
${approve-btn}         //*[@class="indexview__ApproveButton-f6kizg-13 kwXILV"]
${verify-approve}        //*[@id="activities-table"]/tbody/tr[2]/td[2]/div/span
${confirm-btn}          //*[@class="MuiDialogContent-root indexview__PlDialogContent-sc-16lqnlh-3 goCyEE MuiDialogContent-dividers"]/div[3]/button[2]
${verify-modal}        //*[@class="MuiDialogTitle-root indexview__PlTitleDialog-sc-16lqnlh-1 fdOaPR"]/div/div
${modal-header-text}      Confirm Approval
                       
${status-approved}        Approved
