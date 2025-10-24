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
# POSITIVE TESTS - JSONPlaceholder API
Get Users List Successfully
    ${response}=    GET On Session    jsonapi    /users
    Status Should Be    200
    Should Contain    ${response.text}    email
    ${json}=    Evaluate    $response.json()
    Length Should Be    ${json}    10

Get Single User Successfully
    ${response}=    GET On Session    jsonapi    /users/1
    Status Should Be    200
    Should Contain    ${response.text}    email
    ${json}=    Evaluate    $response.json()
    Dictionary Should Contain Key    ${json}    name
    Dictionary Should Contain Key    ${json}    email
    Dictionary Should Contain Key    ${json}    id

# NEGATIVE TESTS
Get Non-Existent User
    ${response}=    GET On Session    jsonapi    /users/999
    Status Should Be    404

Get Posts For User
    ${response}=    GET On Session    jsonapi    /users/1/posts
    Status Should Be    200
    ${json}=    Evaluate    $response.json()
    Should Be True    len($json) > 0

Choosen end point for get 
{
  "page": 0,
  "per_page": 0,
  "total": 0,
  "total_pages": 0,
  "data": [
    {
      "id": 0,
      "email": "string",
      "first_name": "string",
      "last_name": "string",
      "avatar": "string"
    }
  ]
}
