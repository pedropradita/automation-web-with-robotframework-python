*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/base_keyword.robot
Resource    ../keywords/dashboard_keyword.robot
Variables   ../page_objects/login_page.py
Variables   ../page_objects/login_page_google.py
Variables   ../page_objects/home_page.py
Variables   ../page_objects/dashboard_page.py

*** Keywords ***
Open Login Page
    [Arguments]    ${SiteUrl}    ${Browser}
    OpenHomePage    ${SiteUrl}    ${Browser}
    ClickLoginButtonHomePage

Click Login Button Home Page
    click element   ${login_button}

Click Google 0Auth Button
    click element   ${google_0auth_button}

Input Username
    [Arguments]    ${email}
    wait until element is visible   ${email_field}
    input text  ${email_field}   ${email}

Input Password
    [Arguments]    ${password}
    input text  ${password_field}    ${password}

Click Login Button
    click element   ${continue_button}

Verify Successssfull Login
    wait until element is visible   ${password_google_field}
    title should be    Discover Clubs | Aha | Unlimited Exam Questions

Input Email Google
    [Arguments]    ${email}
    wait until element is visible   ${email_google_field}
    input text  ${email_google_field}   ${email}

Click Next Email Button
    click element   ${next_button}

Input Password Google
    [Arguments]    ${password}
    wait until element is visible   ${password_google_field}
    input text  ${password_google_field}   ${password}

Click Next Password Button
    click element   ${next_password_button}

Wait Profile Button is Visible
    wait until element is visible    ${profile_button}    10
    ${visibility_status}    run keyword and return status    element should be visible   ${profile_button}
    [Return]    ${visibility_status}

Success Login with Email
    [Arguments]    ${SiteUrl}    ${Browser}    ${email}    ${password}
    OpenHomePage    ${SiteUrl}    ${Browser}
    ClickLoginButtonHomePage
    InputUsername      ${email}
    InputPassword      ${password}
    ClickLoginButton

Success Login with Google OAuth
    [Arguments]    ${SiteUrl}    ${Browser}    ${email_google}    ${password}
    OpenHomePage    ${SiteUrl}    ${Browser}
    ClickLoginButtonHomePage
    clickgoogle0authbutton
    InputEmailGoogle    ${email_google}
    clicknextemailbutton
    InputPasswordGoogle    ${password}
    clicknextpasswordbutton
