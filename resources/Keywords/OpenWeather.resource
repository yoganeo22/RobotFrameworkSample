*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           RequestsLibrary

Variables         ../Variables/CommonVariables.py

*** Variables ***


*** Keywords ***
GET Coordinates by zip/post code
    ${json_string}=    catenate
    ...  {
    ...    "zip": "E14",
    ...    "name": "London",
    ...    "lat": 51.4969,
    ...    "lon": -0.0087,
    ...    "country": "GB"
    ...  }
    create session    alias=mysession    url=${base_url.data}/geo/1.0/zip?
    ${headers}=  create dictionary   Content-Type=application/json;charset=utf-8
    ${params}=    create dictionary    zip=E14,GB    appid=0572d948333414997de59812fb809231
    ${response}=    GET On Session    alias=mysession    url=${base_url.data}/geo/1.0/zip?    params=${params}
    log to console  GET Coordinates returned status:
    log to console  ${response.status_code}
    log to console  ${response.content}
    # Validations
    should be equal as integers    ${response.status_code}     200
    should contain      json.loads('''${response.content}''')  "zip":"E14"
    should contain      json.loads('''${response.content}''')  "name":"London"
    should contain      json.loads('''${response.content}''')  "lat":51.4969
    should contain      json.loads('''${response.content}''')  "lon":-0.0087
    should contain      json.loads('''${response.content}''')  "country":"GB"
