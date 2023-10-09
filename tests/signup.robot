*** Settings ***
Documentation  Signup Functionality
Library    SeleniumLibrary
Resource    ../resources/keywords/base_keyword.robot
Resource    ../resources/keywords/common_keyword.robot
Resource    ../resources/keywords/signup_keyword.robot
Variables   ../config.py
Variables   ../resources/variables.py
Variables   ../resources/page_objects/dashboard_page.py

Suite Setup  Set Implicit Wait Globally
Test Setup    Open Signup Page    ${${environment}_URL}    ${browser_chrome}
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Signup with Email
    [Documentation]  Success signup with new email
    [Tags]  regression    signup

    ${formatted_date_time}=    Get Current Date Time Formatted
    Input Username      ${sign_email_front}${${environment}_text}.${formatted_date_time}${sign_email_end}
    Input Password      ${password}
    Click Signup Button
    ${visibility_result}    Wait Profile Button is Visible
    should be true    ${visibility_result}

#You can uncomment this case to observe the behavior of signing up with Google email.
#Signup with Gmail
#    [Documentation]  Success signup with new gmail
#
#    ${formatted_date_time}=    Get Current Date Time Formatted
#    Click Google 0auth Button
#    Click Create Account
#    Input First Name    ${test_text}
#    Input Last Name    ${aha_text}
#    Click Next Button
#    Click Month
#    Select Dropdown
#    Input Date    ${start_date}
#    input year    ${register_year}
#    Click Gender Dropdown
#    Select Gender Option
#    Click Gender Next Button
#    ${create_your_own_visible} =  Run Keyword And Return Status    Page Should Contain Element    ${create_your_own}
#    Run Keyword If    '${create_your_own_visible}' == 'True'    Click Create Owm Email
#    Input New Email    ${sign_email_front}${${environment}_text}.${formatted_date_time}
#    Click Email Next Button
#    Input New Password    ${password}
#    Input New Confirm Password    ${password}
#    Click Password Next Button

#For sign-up using a Google email account case, based on my experience, it's not feasible to create automated accounts.
#This is because Google has robust bot detection and verification measures in place, including the requirement for a unique and rarely used phone number for verification.

#For email verification cases, based on my experience, companies often use their own mail servers.
#In such scenarios, the SDET can create a new email account and access the mailbox for verification purposes.
