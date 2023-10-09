*** Settings ***
Library     SeleniumLibrary
Variables    ../variables.py

*** Keywords ***
Set Url Based on Environment
    [Arguments]    ${environment}
    ${url} =    Run Keyword If    '${environment}' == 'staging'
        ...    Set Variable    https://staging.example.com
        ...    ELSE IF    '${environment}' == 'prod'
        ...    Set Variable    https://earnaha.com
        ...    ELSE
        ...    Log    Invalid environment specified: ${environment}

Open Home Page
    [Arguments]    ${SiteUrl}    ${Browser}
    open browser   ${SiteUrl}    ${Browser}
    maximize browser window

Set Implicit Wait Globally
    Set Selenium Implicit Wait    20s

Close Browser
    close all browsers
