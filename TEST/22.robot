*** Settings ***
Library 			SeleniumLibrary
Test Setup			Go to Google
Suite Teardown		Close All Browsers

*** Variables ***
${URL}		https://duckduckgo.com/

*** Test Cases ***
Simple example Search
	Simple Search		Malardalens Universitet


*** Keywords ***
Go to Google
	Open Browser	${URL}		Chrome
	Maximize Browser Window
    Sleep    3 seconds
Simple Search
	[Arguments]		${SearchWord}
    Click Element    id=search_form_input_homepage    ${url}
    Sleep    3 seconds    

	Input Text    class=search__button   ${SearchWord}
    Sleep    3 seconds
	
    Click Element    id=search_button_homepage
    Sleep    5 seconds


    # Input Text    name:q    ${SearchWord}
	# Press Keys    name:q    ENTER


	
