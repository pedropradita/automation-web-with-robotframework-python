*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/dashboard_keyword.robot
Variables    ../page_objects/home_page.py
Variables    ../page_objects/profile_page.py

*** Keywords ***
Click My Profile Button
    wait until element is enabled    ${my_profile_button}    5s
    click element   ${my_profile_button}

Click Edit Profile Button
    wait until element is enabled    ${edit_profile_button}    5s
    click element   ${edit_profile_button}

Is Visible Birthday Field
    wait until element is visible    ${birthday_field}    5s

Click Birthday Button
    Is Visible Birthday Field
    click element   ${birthday_field}

Click Date In Calendar
    [Arguments]    ${target_date}
    ${date_button_locator}    Set Variable    ${date_prefix}${target_date}${date_suffix}
    click element    ${date_button_locator}

Double Click Date In Calendar
    [Arguments]    ${target_date}
    ${date_button_locator}    set variable    ${date_prefix}${target_date}${date_suffix}
    double click element    ${date_button_locator}

Click Ok Button in Calendar
    sleep    1s
    wait until element is enabled    ${ok_calendar_button}    5s
    click element    ${ok_calendar_button}

Click Cancel Button in Calendar
    sleep    1s
    wait until element is enabled    ${cancel_calendar_button}    5s
    click element    ${cancel_calendar_button}

Click Save Button
    wait until element is enabled    ${save_button}    5s
    click element    ${save_button}

Is Visible Success Message
    wait until element is visible    ${success_message}    5s

Generate Random Month
    [Arguments]    ${month_names}
    ${random_month} =    Evaluate    random.choice(${month_names})
    [Return]    ${random_month}

Generate Random Year
    [Arguments]    ${start_year}    ${end_year}
    ${random_year} =    Evaluate    random.randint(${start_year}, ${end_year})
    [Return]    ${random_year}

Click Settings Button
    wait until element is enabled    ${settings_button}    5s
    click element   ${settings_button}

Click Logout Button
    wait until element is enabled    ${settings_button}    5s
    click element   ${logout_button}

Click Yes Button
    click element   ${yes_button}
