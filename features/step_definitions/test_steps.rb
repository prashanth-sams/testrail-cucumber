Given(/^I navigate to Google home page$/) do
    @driver.navigate.to "https://www.google.com/"
end

Then(/^I verify the Google home page$/) do
    expect(@driver.find_element(:id, 'SIvCob').text).to be "Fail Test"
end