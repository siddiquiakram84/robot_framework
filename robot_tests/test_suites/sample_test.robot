*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary

*** Variables ***
${BASE_URL}       ${BASE_URL}
${API_KEY}        ${API_KEY}

*** Test Cases ***
Get Status
    [Tags]    Smoke
    Create Session    api_session    ${BASE_URL}
    ${response}=    GET On Session    api_session    /status    headers={"Authorization": "${API_KEY}"}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.text}
