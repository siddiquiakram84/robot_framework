*** Settings ***
Resource  ../resources/keywords/api_keywords.robot
Variables  ../resources/variables/variables.py

*** Test Cases ***
Test GET Request
    ${response}=    Send GET Request    ${BASE_URL}/endpoint    headers=${DEFAULT_HEADERS}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_json}=    Get JSON    ${response}
    Should Contain    ${response_json}    "expected_key"

Test POST Request
    ${data}=    Create Dictionary    key1=value1    key2=value2
    ${response}=    Send POST Request    ${BASE_URL}/endpoint    headers=${DEFAULT_HEADERS}    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    201
    ${response_json}=    Get JSON    ${response}
    Should Contain    ${response_json}    "key1"
