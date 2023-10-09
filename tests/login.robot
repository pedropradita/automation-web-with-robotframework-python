*** Settings ***
Documentation  Login Functionality
Library    SeleniumLibrary
Resource    ../resources/keywords/base_keyword.robot
Resource    ../resources/keywords/login_keyword.robot
Variables   ../config.py
Variables   ../resources/variables.py
Variables   ../resources/page_objects/dashboard_page.py

Suite Setup  Set Implicit Wait Globally
Test Setup    Open Login Page    ${${environment}_URL}    ${browser_chrome}
Test Teardown    Close Browser

*** Test Cases ***
Login with Email
    [Documentation]  Success login with email
    [Tags]  regression    login

    Input Username      ${email}
    Input Password      ${password}
    Click Login Button
    ${visibility_result}    Wait Profile Button is Visible
    should be true    ${visibility_result}

Login with Google OAuth
    [Documentation]  Success login with Google OAuth
    [Tags]  regression    login

    Click Google 0Auth Button
    Input Email Google    ${email_google}
    Click Next Email Button
    Input Password Google    ${password}
    Click Next Password Button
    ${visibility_result}    Wait Profile Button is Visible
    should be true    ${visibility_result}
