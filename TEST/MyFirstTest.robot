*** Settings ***
Library           SeleniumLibrary
Suite Setup     Go to homepage
Suite Teardown    Close Browser

*** Variables ***
${browser}        chrome   
${url}     https://duckduckgo.com/

*** Keywords ***
Go to homepage
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

*** Test Cases ***
Search for Malardalens Universitet
  
    Wait Until Element Is Enabled  search_form_input_homepage
    Input Text          search_form_input_homepage  Malardalens Universitet
    Click Button        search_button_homepage
    Sleep    5 seconds
    [Teardown]          Close Browser

