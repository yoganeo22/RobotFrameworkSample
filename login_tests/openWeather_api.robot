*** Settings ***
Documentation    Suite description
Library          RequestsLibrary

Resource		 ../resources/Keywords/OpenWeather.resource

*** Variables ***

*** Test Cases ***
Test Scenarios
    GET Coordinates by zip/post code