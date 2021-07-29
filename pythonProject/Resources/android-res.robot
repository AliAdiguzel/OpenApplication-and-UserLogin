*** Settings ***
Library   AppiumLibrary
Resource  password.robot

*** Variables ***

#*** Test Variables ***
${USER1-DETAILS}        email=${EMAIL}    password=${PASSWORD}
${USER2-DETAILS}        email=${EMAIL2}   password=${PASSWORD2}

#*** Application Variables ***
${CHAT21-APPLICATION-ID}                chat21.android.demo
${CHAT21-APPLICATION-ACTIVITY}          chat21.android.demo.SplashActivity

#*** Login Page ***

${LOGIN-EMAIL-FIELD}     id=${CHAT21-APPLICATION-ID}:id/email
${LOGIN-PASSWORD-FIELD}  ${CHAT21-APPLICATION-ID}:id/password
${LOGIN-SIGNIN-BUTTON}   id=${CHAT21-APPLICATION-ID}:id/login

#*** Main Page ***

${MAIN-HOME-TAB}         //android.widget.TextView[@text="HOME"]
${MAIN-PROFILE-TAB}      //android.widget.TextView[@text="PROFILE"]

#*** Profile Page ***
${PROFILE-LOGOUT-BUTTON}  id=${CHAT21-APPLICATION-ID}:id/logout

*** Keywords ***

Open Chat21 Application
        Open Application      http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=${CHAT21-APPLICATION-ID}    appActivity=${CHAT21-APPLICATION-ACTIVITY}   automationName=Uiautomator2

Signin With User
    [Arguments]           ${EMAIL}     ${USERPASSWORD}
    Input User Email      ${EMAIL}
    Input User Password   ${USERPASSWORD}
    Submit Login
    Verify Login Is Successful

Input User Email
    [Arguments]    ${EMAIL}
    Verify Login Email Field Is Displayed
    Input Text                              ${LOGIN-EMAIL-FIELD}        ${EMAIL}

Input User Password
    [Arguments]  ${USERPASSWORD}
    Input Text                              ${LOGIN-PASSWORD-FIELD}     ${USERPASSWORD}

Submit Login
    Click Element                           ${LOGIN-SIGNIN-BUTTON}

Verify Login Is Successful
    Wait Until Page Contains Element        ${main-home-tab}

Logout With User
    Go To Profile Page
    Click The Logout Button
    Verify Login Email Field Is Displayed

Go To Profile Page
    Click Element                           ${MAIN-PROFILE-TAB}
    WAIT UNTIL PAGE CONTAINS ELEMENT        ${PROFILE-LOGOUT-BUTTON}

Click The Logout Button
    CLICK ELEMENT                           ${PROFILE-LOGOUT-BUTTON}

Verify Login Email Field Is Displayed
    WAIT UNTIL PAGE CONTAINS ELEMENT        ${LOGIN-EMAIL-FIELD}
