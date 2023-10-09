*** Settings ***
Documentation  Profile Functionality
Library    SeleniumLibrary
Resource    ../resources/keywords/base_keyword.robot
Resource    ../resources/keywords/common_keyword.robot
Resource    ../resources/keywords/login_keyword.robot
Resource    ../resources/keywords/logout_keyword.robot
Resource    ../resources/keywords/profile_keyword.robot
Variables   ../config.py
Variables   ../resources/variables.py

Suite Setup  Set Implicit Wait Globally
Test Setup    SuccessLoginWithEmail    ${${environment}_url}    ${browser_chrome}    ${email}    ${password}
Test Teardown    Close Browser

*** Test Cases ***
Edit birthday date
    [Documentation]  Success edit birthday date
    [Tags]  regression    profile

    ClickProfileButton
    ClickEditProfileButton
    ClickBirthdayButton

    #Generate random date month year
    ${random_month} =    Random from List    ${month_names}
    ${random_date} =    Random from Range Number    ${start_date}    ${end_date}
    ${random_year} =    Random from Range Number    ${start_year}    ${end_year}
    Log To Console    \nRandom date: ${random_date} \nRandom month: ${random_month} \nRandom year: ${random_year}

    #Combine random date month year
    ${random_month_year} =  Catenate  ${random_month}    ${random_year}
    ${random_date_month_year} =  Catenate  ${random_date}    ${random_month}    ${random_year}
    Log To Console    \nCombine random month year: ${random_month_year} \nCombine random date month year: ${random_date_month_year}

    #Get current year
    ${current_month_year}    Get Text    ${month_year_text_calendar}
    ${current_year}    Set Variable    ${current_month_year.split()[1]}
    Log To Console    \nCurrent month year: ${current_month_year} \nCurrent year: ${current_year}

    #Get full date on birthday field
    ${birthday_field_text}    Get Value    ${birthday_field}
    Log To Console    \nDate on field: ${birthday_field_text}

    #Get date from full date
    ${current_birthday_field_text}    Set Variable    ${birthday_field_text}
    ${formatted_current_date}    Set Variable    ${EMPTY}
    ${is_not_empty}    Run Keyword And Return Status    Should Not Be Empty    ${current_birthday_field_text}

    IF    ${is_not_empty}
        ${formatted_current_date}    Split and Format Date    ${current_birthday_field_text}
        Log To Console    \nFormatted Date: ${formatted_current_date}
    ELSE
        Log To Console    The birthday field is empty
    END

    #Search the random month year on calendar
    ${target_date} =    Click Previous or Next Button until Date Found    ${random_month_year}   # Replace with your target date
    Log To Console    \nMonth year after search: ${target_date}

    #Select date on calendar
    IF    '${random_month_year}' != '${target_date}'
        Log To Console    \nDate not found after max attempts
    ELSE IF   '${formatted_current_date}'.isdigit()
        IF    '${formatted_current_date}' == '${random_date}'
            IF    '${current_month_year}' == '${random_month_year}'
                Double Click Date In Calendar    ${random_date}
            ELSE
            Click Date In Calendar    ${random_date}
            END
        ELSE
            Click Date In Calendar    ${random_date}
        END
    ELSE
        Click Date In Calendar    ${random_date}
    END

    Click Ok Button in Calendar
    Click Save Button
    Is Visible Success Message
    wait until element is visible    ${birthday_field}

    ${birthday_text}    Get Value    ${birthday_field}
    Log To Console    \nMonth year after save: ${birthday_text}

    ClickBirthdayButton
    ${current_month_year}    Get Text    ${month_year_text_calendar}

    should be equal    ${current_month_year}    ${random_month_year}
