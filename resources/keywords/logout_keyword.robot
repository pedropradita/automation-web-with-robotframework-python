*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/dashboard_keyword.robot
Resource    ../keywords/profile_keyword.robot
Variables    ../page_objects/home_page.py
Variables    ../page_objects/profile_page.py

*** Keywords ***
Logout Steps
    ClickProfileButton
    ClickSettingsButton
    ClickLogoutButton
    ClickYesButton

Wait Text after Logout is Visible
    wait until element is visible    ${success_logout_text}    10
    ${visibility_status}    run keyword and return status    element should be visible   ${success_logout_text}
    [Return]    ${visibility_status}

Get Text after Logout
    ${text}    get text    ${success_logout_text}
    [Return]    ${text}
