*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Go to homepage
Suite Teardown    Close Browser



*** Variables ***
${browser}    chrome
${homepage}    https://www.google.com/
${url}    https://www.mdu.se/en/malardalen-university/education/find-education

*** Keywords ***

Go to homepage

    Open Browser    ${homepage}    ${browser}
    SeleniumLibrary.Maximize Browser Window
    Click Button    id=L2AGLb
   
    

Search_MDH
    
    [Arguments]    ${searchkey}    ${result}
    Input Text    name=q    find courses at mdh
    Wait Until Page Does Not Contain    ${searchkey}
    Press Keys    name=q    RETURN
    Go to     ${url}
    
    
Open courses page
    Go to     https://www.mdu.se/en/malardalen-university/education/find-education
    

Search for a course 
    [Arguments]    ${searchkey}    ${result}
    Input Text    id=education-search-input    ${searchkey}
    Click Element    class=mdh-search-education__submit-button
    Wait Until Page Contains    ${searchkey}
    Click Element   class=env-button--primary
    Sleep    5 seconds


    
    [Teardown]    Close Browser

*** Test Cases ***
Search for mdh
    Search_MDH    find education at mdh    ${url}

Courses page
    Open courses page

Search courses
    Search for a course    Algebra    ${url}
     



   
    
