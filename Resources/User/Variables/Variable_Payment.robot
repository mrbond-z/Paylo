*** Variables ***
${payment_url}         https://staging-pay.pay-lo.com/
${stripe_url}          https://staging-pay.pay-lo.com/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlSEp0ZHpScCIsImV4cCI6MTU5MDE2NzIwMSwiaWF0IjoxNTkwMDgwODAxfQ.H272E-XWyLbBF8pojyCdeirpaz9_5DvKLnvekB838yc/creditcard
${amount_xpath}        //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[1]/input
${publick_xpath}       //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[2]/input
${privatek_xpath}      //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[3]/input
${name-xpath}          //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[4]/input
${email-xpath}         //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[5]/input
${success_url_xpath}         //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[6]/input
${fail_url_xpath}            //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[7]/input
${back_url_xpath}            //*[@id="root"]/div/div[2]/div[2]/div[2]/form/div[8]/input
${pay_button}          //*[@id="root"]/div/div[2]/div[2]/div[2]/form/button/span[1]

${credit_button}        //*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div/a[1]
${verify_credit_form}    //*[@class="MotionDiv__CustomizedMotion-g582sk-0 cIuYiT"]/h3
${cardno_xpath}        id=cardNumber   
${cardno_focus_xpath}      //*[@id="root"]/div/iframe    #//*[@class="ElementsApp is-empty is-focused"]/span[2]/div/div[2]/span/input
${cardexp_xpath}       id=cardExpiry    #//*[@id="cardExpiry"]/div/iframe
${cardcvc_xpath}       id=cardCvc       #//*[@id="cardCvc"]/div/iframe     #//*[@id="cardCvc-label"]
${submit_btn}          //*[@class="MuiButton-label"]

${amount}      100
${public_key}     4ad9b1bfce86972fceaacce22205c7c3
${private_key}    b5e31dec4ea71691a5d76581ff07d6c08b4e8d67c409320b7eb1cec95e525ba8
${name}           BOND
${email}          nathakrit.p@gmail.com
${success_url}    https://pngriver.com/wp-content/uploads/2018/04/Download-Success-PNG-Image.png
${fail_url}       https://img.pngio.com/fail-png-97-images-in-collection-page-1-failure-png-660_320.png
${back_url}       https://image.flaticon.com/icons/svg/0/340.svg

#Payment form
${back-btn}       //*[@class="indexview__Wrapper-sc-1311no6-0 dzTgBE"]/div/div/div[2]/a

${card_number}     4242 4242 4242 4242
${exp_date}       02/22
${cvc}            333

#Paypal account sandbox
${emailPaypal}         dev.20scoops-buyer@gmail.com
${passwordPaypal}     12345678

${verify_fail}      //*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/form/div[1]/p/strong

