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
Validate Playwright Page using Relative XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using Absolute XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath:/html/body/div/nav/div/div/div/ul/li/a[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using Contains XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://a[contains(@data-language-prefix, '/${PREFIX}/')]
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using Text() XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__menu']//*[text()='${LANGUAGE}']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using starts-with() XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://a[starts-with(@data-language-prefix, '/${PREFIX}/')]
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using chained XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__menu']//*[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using axes following XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__link undefined dropdown__link--active']//following::li//a[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using axes preceding XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__link']//preceding::li//a[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using axes child XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__menu']//child::li//a[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser

Validate Playwright Page using axes parent XPath
    Open Browser To Main Page
    Mouse Over    xpath://*[@class='navbar__link']
    Click Element    xpath://*[@class='dropdown__link']//parent::li//a[@data-language-prefix='/${PREFIX}/']
    Wait Until Element Contains    xpath://*[@class='navbar__title text--truncate']    Playwright for ${LANGUAGE}
    [Teardown]    Close Browser
