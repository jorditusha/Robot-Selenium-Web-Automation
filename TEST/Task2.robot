*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Go to homepage
Suite Teardown    Close Browser



*** Variables ***
${browser}    chrome
${HOMEPAGE}    https://wwww.google.com
${url}    https://www.mdu.se/en/malardalen-university/education/find-education

*** Keywords ***
Go to homepage

    Open Browser    ${url}    ${browser}
    SeleniumLibrary.Maximize Browser Window

Search for G1N courses

    [Arguments]    ${searchkey}    ${result}
    Click Element   class=env-button--primary
    Wait Until Page Does Not Contain    ${searchkey}
    Click Element   class=mdh-search-form__filter-toggle-button
    Wait Until Element Is Visible    class=mdh-form__dropdown
    Click Element   class=mdh-form__dropdown
    Click Element   id=progressivespecialisation-G1N
    Input Text    id=education-search-input    ${searchkey}
    Click Element    class=mdh-search-education__submit-button
    Wait Until Page Contains    ${searchkey}
    Click Element    class=mdh-search-form__filter-toggle-button
    Sleep    5 seconds  

    [Teardown]    Close Browser


*** Test Cases ***

Search for programming courses that have only upper secondary education requirments
    Search for G1N courses    programming    ${url}ro 

