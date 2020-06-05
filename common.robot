*** Settings ***

#Librarys
Library     SeleniumLibrary      timeout=10
Library     RequestsLibrary
Library     HttpLibrary.HTTP
Library     Collections
Library     String
Library     OperatingSystem
Library     JSONLibrary


#------------------------------APIs-----------------------------------------#
#Keywords APIs
Resource    Resources/Api/Keywords/Keyword_api_login.robot
Resource    Resources/Api/Keywords/Keyword_api_pay.robot
Resource    Resources/Api/Keywords/Keyword_api_merchant_regis.robot
Resource    Resources/Api/Keywords/Keyword_api_backoffice.robot

#Variables APIs
Resource    Resources/Api/Variables/Api_variables.robot
#---------------------------------------------------------------------------#

#------------------------------User-----------------------------------------#
#Keywords User
Resource    Resources/User/Keywords/Keyword_user_pay.robot

#Variablles User
Resource    Resources/User/Variables/Variable_payment.robot
#---------------------------------------------------------------------------#

#------------------------------Merchant-----------------------------------------#
#Keyword Merchant
Resource    Resources/Merchant/Keywords/Keyword_merchant_login.robot
Resource    Resources/Merchant/Keywords/Keyword_register.robot
Resource    Resources/Merchant/Keywords/Keyword_verify_info.robot
Resource    Resources/Merchant/Keywords/Keyword_verify_payment.robot
#Variable Merchant
Resource    Resources/Merchant/Variables/Variable_merchant_login.robot
Resource    Resources/Merchant/Variables/Variable_register.robot
Resource    Resources/Merchant/Variables/Variable_verify_info.robot

#-------------------------------------------------------------------------------#

#------------------------------Backoffice---------------------------------------#
#Keywords Backoffice
Resource    Resources/Backoffice/Keywords/Keyword_backoffice_login.robot
#Variables Backoffice
Resource    Resources/Backoffice/Variables/Variable_backoffice_login.robot

