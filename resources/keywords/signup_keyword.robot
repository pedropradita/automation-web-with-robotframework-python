*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/base_keyword.robot
Resource    ../keywords/dashboard_keyword.robot
Variables   ../page_objects/signup_page.py
Variables   ../page_objects/signup_page_google.py
Variables   ../page_objects/login_page_google.py
Variables   ../page_objects/home_page.py
Variables   ../page_objects/dashboard_page.py

*** Keywords ***
Open Signup Page
    [Arguments]    ${SiteUrl}    ${Browser}
    OpenHomePage    ${SiteUrl}    ${Browser}
    Click Signup Button Home Page

Click Signup Button Home Page
    click element   ${signup_button}

Input Username
    [Arguments]    ${email}
    wait until element is visible   ${email_field}
    input text  ${email_field}   ${email}

Input Password
    [Arguments]    ${password}
    input text  ${password_field}    ${password}

Click Signup Button
    click element   ${continue_button}

Click Google 0Auth Button
    click element   ${google_0auth_button}

Click Create Account
    click element    ${create_account}

Input First Name
    [Arguments]    ${first_name}
    input text  ${first_name_field}    ${first_name}

Input Last Name
    [Arguments]    ${last_name}
    input text  ${last_name_field}    ${last_name}

Click Next Button
    click element    ${next_button}

Click Gender Next Button
    click element    ${gender_next_button}

Click Month
    wait until element is visible   ${month_field}
    click element    ${month_field}

Select Dropdown
    click element    ${option_dropdown}

Input Month
    [Arguments]    ${month}
    input text  ${month_field}    ${month}

Input Date
    [Arguments]    ${date}
    input text  ${day_field}    ${date}

Input Year
    [Arguments]    ${year}
    input text  ${year_field}    ${year}

Click Gender Dropdown
    click element    ${gender_dropdown}

Select Gender Option
    click element    ${gender_option}

Click Create Owm Email
    ${status}    wait until element is visible   ${create_your_own}
    click element    ${create_your_own}
    [Return]  ${status}

Input New Email
    [Arguments]    ${new_email}
    input text  ${new_email_field}    ${new_email}

Click Email Next Button
    click element    ${email_next_button}

Input New Password
    [Arguments]    ${new_password}
    wait until element is visible   ${new_password_field}
    input text  ${new_password_field}    ${new_password}

Input New Confirm Password
    [Arguments]    ${new_confirm_password}
    input text  ${new_confirm_password_field}   ${new_confirm_password}

Click Password Next Button
    click element    ${password_next_button}

Verify Successssfull Signup
    wait until element is visible   ${password_google_field}
    title should be    Discover Clubs | Aha | Unlimited Exam Questions

Wait Profile Button is Visible
    wait until element is visible    ${profile_button}    10
    ${visibility_status}    run keyword and return status    element should be visible   ${profile_button}
    [Return]    ${visibility_status}

