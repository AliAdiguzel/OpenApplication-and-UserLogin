*** Settings ***
Library                  AppiumLibrary
Resource                 ..//Resources/password.robot

*** Variables ***

#*** Test Variables ***
${USER1-DETAILS}        email=${EMAIL}  password=${PASSWORD}
${USER2-DETAILS}        email=${EMAIL2} password=${PASSWORD2}


#*** Login Page ***

${LOGIN-EMAIL-FIELD}     id=chat21.android.demo:id/email
${LOGIN-PASSWORD-FIELD}  chat21.android.demo:id/password
${LOGIN-SIGNIN-BUTTON}   id=chat21.android.demo:id/login

#*** Main Page ***

${MAIN-HOME-TAB}         //android.widget.TextView[@text="HOME"]
${MAIN-PROFILE-TAB}      //android.widget.TextView[@text="PROFILE"]

#*** Profile Page ***
${PROFILE-LOGOUT-BUTTON}  id=chat21.android.demo:id/logout


*** Test Cases ***
Login2
    WAIT UNTIL PAGE CONTAINS ELEMENT        ${LOGIN-EMAIL-FIELD}
    input text                              ${LOGIN-EMAIL-FIELD}        ${EMAIL2}
    input text                              ${LOGIN-PASSWORD-FIELD}     ${PASSWORD2}
    click element                           ${LOGIN-SIGNIN-BUTTON}
    wait until page contains element        ${main-home-tab}