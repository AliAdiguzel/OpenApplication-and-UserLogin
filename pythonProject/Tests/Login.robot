*** Settings ***
Library                  AppiumLibrary
Resource                 ..//Resources/android-res.robot

*** Test Cases ***
Login
    Open Chat21 Application
    Signin With User                        ${email}    ${password}
    Logout With User
    Signin With User                        ${email2}   ${password2}
