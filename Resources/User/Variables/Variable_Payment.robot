*** Variables ***
${payment_url}         https://staging-pay.pay-lo.com/
${stripe_url}          https://staging-pay.pay-lo.com/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlSEp0ZHpScCIsImV4cCI6MTU5MDE2NzIwMSwiaWF0IjoxNTkwMDgwODAxfQ.H272E-XWyLbBF8pojyCdeirpaz9_5DvKLnvekB838yc/creditcard
${amount_xpath}        //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[1]/input
${publick_xpath}       //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[2]/input
${privatek_xpath}      //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[3]/input
${success_url_xpath}         //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[6]/input
${fail_url_xpath}            //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[7]/input
${back_url_xpath}            //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[8]/input
${pay_button}          //*[@id="root"]/div/div[2]/div[2]/div[2]/form/button/span[1]

${credit_button}       //*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div/a[1]
${cardno_xpath}        id=cardNumber     #//*[@id="cardNumber"]/div/iframe
${cardexp_xpath}       id=cardExpiry    #//*[@id="cardExpiry"]/div/iframe
${cardcvc_xpath}       id=cardCvc       #//*[@id="cardCvc"]/div/iframe     #//*[@id="cardCvc-label"]
${submit_btn}          //*[@class="MuiButton-label"]

${amount}      100
${public_key}     930d99005c6b421c8657a609b92ef550
${private_key}    8e02141a530a38c3647777ca1678a29f6f915e4951744fc80b78f39ff18cdef4
${success_url}    https://pngriver.com/wp-content/uploads/2018/04/Download-Success-PNG-Image.png
${fail_url}       https://img.pngio.com/fail-png-97-images-in-collection-page-1-failure-png-660_320.png
${back_url}       https://image.flaticon.com/icons/svg/0/340.svg

${card_number}     4242 4242 4242 4242
${exp_date}       02/22
${cvc}            333

#Paypal account sandbox
${emailPaypal}         dev.20scoops-buyer@gmail.com
${passwordPaypal}     12345678

${verify_fail}      //*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/form/div[1]/p/strong

