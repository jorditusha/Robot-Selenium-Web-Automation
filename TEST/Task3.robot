*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Go to homepage
Suite Teardown    Close Browser



*** Variables ***
${browser}    chrome
${url}    https://www.mdu.se/en/malardalen-university/education/find-education

*** Keywords ***
Go to homepage

    Open Browser    ${url}    ${browser}
    SeleniumLibrary.Maximize Browser Window

Search for G1F courses
    
    [Arguments]    ${searchkey}    ${result}
    
    
    Click Element   class=env-button--primary
    Sleep    3 seconds
    Click Element   class=mdh-search-form__filter-toggle-button
    Sleep   3 seconds
    Click Element   class=mdh-form__dropdown
    Sleep   3 seconds
    Click Element   id=progressivespecialisation-G1F
    Sleep    3 seconds
    Input Text    id=education-search-input    ${searchkey}
    Sleep    3 seconds
    Click Element    class=mdh-search-education__submit-button
    Sleep    3 seconds    
    Click Element    class=mdh-search-form__filter-toggle-button
    Sleep    5 seconds  
    

    [Teardown]    Close Browser

*** Test Cases ***

Search for programming courses that have only upper secondary education requirments
    Search for G1F courses    Algebra    ${url} 

