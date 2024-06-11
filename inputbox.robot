*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demo.nopcommerce.com
${options}  headless, no-sandbox, disable-dev-shm-usage

*** Test Cases ***
TestingInputBox
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    options=${chrome_options}
    Go To    ${url}
    Maximize Browser Window
    Title Should Be    nopCommerce demo store
    Click Link    xpath://a[@class='ico-login']
    ${email_txt}    Set Variable    id:Email

    Element Should Be Visible    ${email_txt}
    Element Should Be Enabled    ${email_txt}

    Input Text    ${email_txt}    JohnDavid@gmail.com
    Sleep    3
