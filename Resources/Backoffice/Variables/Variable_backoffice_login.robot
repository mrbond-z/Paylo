*** Variables ***

#Url Merchant
${backoffice_url}      https://staging.pay-lo.com/backoffice/signin


#values
${backoffice-email}      paylobackoffice@gmail.com
${backoffice-pass}       20Scoops#

#Verify login 
${verify-backoffice-login}       //*[@class="indexview__Detail-sc-1xe4kbd-4 biAUkl"]/h5
${backoffice-name}        Paylo Backoffice

#Dashboard
${merchant-menu}         //*[@class="indexview__SidebarTop-sc-17scg71-1 fMJGjG"]/ul/li[3]

#Merchant page
${approve-btn}         //*[@class="indexview__ApproveButton-f6kizg-13 kwXILV"]
${verify-approve}        //*[@class="Table__TableScroll-sc-1d7s95x-0 bqcMDC"]/table/tbody/tr[2]/td[2]/div/span
${confirm-btn}          //*[@class="MuiPaper-root MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiPaper-elevation0 MuiPaper-rounded"]/div[2]/div[3]/button[2]
${verify-modal}         //*[@class="MuiPaper-root MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiPaper-elevation0 MuiPaper-rounded"]/div[1]/div[1]/div
${modal-header-text}      Confirm Approval
                       
${status-approved}        Approved
