* Settings *
Library    SeleniumLibrary    
Suite Setup    Go to homepage
Suite Teardown    Close Browser



* Variables *
${browser}    chrome
${url}    https://www.mdu.se/en/malardalen-university/education/find-education

* Keywords *
Go to homepage

    Open Browser    ${url}    ${browser}
    SeleniumLibrary.Maximize Browser Window

Search for Full Time Courses

    [Arguments]    ${searchkey}    ${result}
    Click Element   class=env-button--primary
    Sleep    1 seconds
    Click Element   class=mdh-form__dropdown-button--filter
    Click Element   id=button_studypace
    Click Element    //label[@for="studypace-100" and @class="mdh-form__checkbox--label" and text()="Full time"]
    Input Text    id=education-search-input    ${searchkey}
    Click Element    class=mdh-search-education__submit-button
    Wait Until Page Contains    ${searchkey} 

    Sleep    5 seconds  
    

    [Teardown]    Close Browser

* Test Cases *

Search for full time courses 
    Search for Full Time Courses    Math    ${url}