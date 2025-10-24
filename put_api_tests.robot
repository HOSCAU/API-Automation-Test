*** Settings ***
Library    Collections
Library    RequestsLibrary

Suite Setup    Create API Session
Suite Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${USER_ID}     1

*** Keywords ***
Create API Session
    Create Session    jsonapi    ${BASE_URL}    verify=true

*** Test Cases ***
Update User With Valid Data
    &{headers}=    Create Dictionary    Content-Type=application/json
    &{data}=    Create Dictionary    
    ...    name=John Smith    
    ...    email=john.smith@example.com    
    ...    updatedAt=2024-01-01T12:00:00Z
    
    ${response}=    PUT On Session    jsonapi    /users/${USER_ID}    
    ...    json=${data}    
    ...    headers=${headers}
    
    Status Should Be    200
    Should Contain    ${response.text}    updatedAt

Update Post With Valid Data
    &{headers}=    Create Dictionary    Content-Type=application/json
    &{data}=    Create Dictionary    
    ...    title=Updated Title    
    ...    body=Updated body content    
    ...    updatedAt=2024-01-01T12:00:00Z
    
    ${response}=    PUT On Session    jsonapi    /posts/1    
    ...    json=${data}    
    ...    headers=${headers}
    
    Status Should Be    200
    Should Contain    ${response.text}    updatedAt

Update Non-Existent User
    &{data}=    Create Dictionary    
    ...    name=Test User    
    ...    updatedAt=2024-01-01T12:00:00Z
    
    ${response}=    PUT On Session    jsonapi    /users/999    
    ...    json=${data}
    
    Status Should Be    500

Update With Invalid Data
    &{data}=    Create Dictionary    
    ...    name=12345
    ...    updatedAt=invalid_date
    
    ${response}=    PUT On Session    jsonapi    /users/${USER_ID}    
    ...    json=${data}
    
    Status Should Be    200

Update With Empty Data
    &{data}=    Create Dictionary
    
    ${response}=    PUT On Session    jsonapi    /users/${USER_ID}    
    ...    json=${data}
    
    Status Should Be    200


Choosen end for put 
{
  "updatedAt": "string"
} 
