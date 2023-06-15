*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/Keywords/Playwright.resource

*** Variables ***  
${LANGUAGE}         Python
${PREFIX}           python
${BROWSER}        Chrome

*** Test Cases ***
Validate Playwright Page
    Open Browser To Login Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser
