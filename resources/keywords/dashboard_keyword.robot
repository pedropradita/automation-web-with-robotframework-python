*** Settings ***
Library     SeleniumLibrary
Variables    ../page_objects/dashboard_page.py

*** Keywords ***
Click Profile Button
    wait until element is visible    ${profile_button}    20s
    click element    ${profile_button}
