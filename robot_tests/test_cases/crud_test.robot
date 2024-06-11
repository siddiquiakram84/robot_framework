*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Variables  ../resources/variables/variables.py

*** Test Cases ***
GET All Users
    [Documentation]    Test to get all users
    [Tags]             smoke
    ${response}    GET On Session    ${BASE_URL}/users
    Should Be Equal As Strings    ${response.status_code}    200

GET Single User
    [Documentation]    Test to get a single user
    [Tags]             smoke
    ${response}    GET On Session    ${BASE_URL}/users/1
    Should Be Equal As Strings    ${response.status_code}    200

CREATE User
    [Documentation]    Test to create a new user
    [Tags]             regression
    ${data}=    Create Dictionary    name=Test User
    ${response}    POST On Session    ${BASE_URL}/users    json=${data}
    Should Be Equal As Strings    ${response.status_code}    201

UPDATE User
    [Documentation]    Test to update an existing user
    [Tags]             regression
    ${data}=    Create Dictionary    name=Updated User
    ${response}    PUT On Session    ${BASE_URL}/users/1    json=${data}
    Should Be Equal As Strings    ${response.status_code}    200

DELETE User
    [Documentation]    Test to delete an existing user
    [Tags]             regression
    ${response}    DELETE On Session    ${BASE_URL}/users/1
    Should Be Equal As Strings    ${response.status_code}    200
