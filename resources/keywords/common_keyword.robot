*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../variables.py
Variables    ../page_objects/profile_page.py

*** Keywords ***
Random from List
    [Arguments]    ${lists}
    ${random_list} =    Evaluate    random.choice(${lists})
    [Return]    ${random_list}

Click Previous or Next Button until Date Found
    [Arguments]    ${random_month_year}
    FOR    ${i}    IN RANGE    ${max_attempts}
        ${current_month_year}    Get Text    ${month_year_text_calendar}
        ${convert_random_month_year}     Convert Date    ${random_month_year}    date_format=%B %Y
        ${convert_current_month_year}    Convert Date    ${current_month_year}    date_format=%B %Y
        Run Keyword If    '${convert_current_month_year}' == '${convert_random_month_year}'    Exit For Loop
        Run Keyword If    '${convert_random_month_year}' > '${convert_current_month_year}'    Click Element    ${calendar_next_button}
        ...     ELSE
        ...     Click Element    ${calendar_previous_button}
    END
    [Return]    ${current_month_year}

Split and Format Date
    [Arguments]    ${date}
    ${date_parts}    Split String    ${date}    /
    ${day}    Set Variable    ${date_parts[0]}
    ${month}    Set Variable    ${date_parts[1]}
    ${year}    Set Variable    ${date_parts[2]}
    ${finally_day}    Evaluate    "${day}".lstrip("0")
    ${formatted_date}    Set Variable    ${finally_day}
    [Return]    ${formatted_date}

Click Button with Refresh and Retry
    [Timeout]    5s
    [Arguments]    ${element}
    FOR    ${i}    IN RANGE    3
        wait until element is enabled    ${element}
        Click Element    ${element}
        ${is_clicked}    Element Should Be Visible    Profile Page Element
        Run Keyword If    '${is_clicked}' == 'True'    Exit For Loop
        Reload Page
    # After 3 attempts, if it still fails to click, raise an error
    Log    Clicking the My Profile button failed after 3 attempts.
    Fail    Clicking My Profile Button Failed
    END

Random from Range Number
    [Arguments]    ${start}    ${end}
    ${random_number} =    Evaluate    random.randint(${start}, ${end})
    [Return]    ${random_number}

Get Current Date Time Formatted
    ${formatted_current_date}    Get Current Date    result_format=%Y%m%d%H%M%S
    Log To Console    \nCurrent date: ${formatted_current_date}
    [Return]    ${formatted_current_date}
