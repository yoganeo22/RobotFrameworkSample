*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/Keywords/Google.resource

*** Test Cases ***
Invalid Login
    Open Browser To Login Page
    Title Should Be    Sign in - Google Accounts
    Input Text    xpath://*[@id='identifierId']    demo    True
    Click Button    xpath://*[@class='VfPpkd-LgbsSe VfPpkd-LgbsSe-OWXEXe-k8QpJ VfPpkd-LgbsSe-OWXEXe-dgl2Hf nCP5yc AjY5Oe DuMIQc LQeN7 qIypjc TrZEUc lw1w4b']
    Wait Until Element Contains    xpath://*[@class='o6cuMc Jj6Lae']    Couldn’t find your Google Account
    [Teardown]    Close Browser

