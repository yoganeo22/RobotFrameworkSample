*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***  
#localhost:7272
${SERVER}         playwright.dev    
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      https://${SERVER}/

*** Keywords ***
Open Browser To Main Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Main Page Should Be Open

Main Page Should Be Open
    Title Should Be    Fast and reliable end-to-end testing for modern web apps | Playwright

