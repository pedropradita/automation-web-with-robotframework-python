*** Settings ***
Documentation  Logout Functionality
Library  SeleniumLibrary
Resource    ../resources/keywords/base_keyword.robot
Resource    ../resources/keywords/login_keyword.robot
Resource    ../resources/keywords/logout_keyword.robot
Resource    ../resources/keywords/dashboard_keyword.robot
Resource    ../resources/keywords/profile_keyword.robot
Variables   ../config.py
Variables   ../resources/variables.py

Suite Setup  Set Implicit Wait Globally
Test Teardown    Close Browser

*** Test Cases ***
Logout With Email
    [Documentation]  Success logout with email
    [Tags]  regression    logout

    Success Login with Email    ${${environment}_url}    ${browser_chrome}    ${email}    ${password}
    Logout Steps
    Wait Text After Logout is Visible
    ${text_after_logout}    Get Text After Logout
    should be equal    ${text_after_logout}    ${expected_after_logout_text}

Logout With Google OAuth
    [Documentation]  Success logout with GoogleOAuth
    [Tags]  regression    logout

    Success Login with Google OAuth    ${${environment}_url}    ${browser_chrome}    ${email_google}    ${password}
    Logout Steps
    Wait Text After Logout is Visible
    ${text_after_logout}    Get Text After Logout
    should be equal    ${text_after_logout}    ${expected_after_logout_text}


