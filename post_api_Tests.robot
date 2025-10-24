*** Settings ***
Library    Collections
Library    RequestsLibrary

Suite Setup    Create API Session
Suite Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Create API Session
    Create Session    jsonapi    ${BASE_URL}    verify=true

*** Test Cases ***
Create New User With Valid Data
    &{headers}=    Create Dictionary    Content-Type=application/json
    &{data}=    Create Dictionary    
    ...    username=johndoe    
    ...    email=john.doe@example.com    
    ...    password=securepassword123
    
    ${response}=    POST On Session    jsonapi    /users    
    ...    json=${data}    
    ...    headers=${headers}
    
    Status Should Be    201
    Should Contain    ${response.text}    id

Create New Post With Valid Data
    &{headers}=    Create Dictionary    Content-Type=application/json
    &{data}=    Create Dictionary    
    ...    title=My New Post    
    ...    body=This is the post content    
    ...    userId=1
    
    ${response}=    POST On Session    jsonapi    /posts    
    ...    json=${data}    
    ...    headers=${headers}
    
    Status Should Be    201
    Should Contain    ${response.text}    id

Create User With Missing Required Fields
    &{data}=    Create Dictionary    
    ...    username=johndoe    
    
    ${response}=    POST On Session    jsonapi    /users    
    ...    json=${data}
    
    Status Should Be    201

Create User With Invalid Email Format
    &{data}=    Create Dictionary    
    ...    username=johndoe    
    ...    email=invalid-email    
    ...    password=pass123
    
    ${response}=    POST On Session    jsonapi    /users    
    ...    json=${data}
    
    Status Should Be    201

Create User With Empty Data
    &{data}=    Create Dictionary
    
    ${response}=    POST On Session    jsonapi    /users    
    ...    json=${data}
    
    Status Should Be    201


Choosen EndPoint for Post

{
  "username": "string",
  "email": "string",
  "password": "string"
}
