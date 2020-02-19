Given(/^I navigate to Google home page$/) do
  @driver.navigate.to "https://www.google.com/"
end

Then(/^I verify the Google home page$/) do
  expect(@driver.find_element(:id, 'SIvCob').text.include? 'Google').to be true
end

Then(/^I fail to load Google home page$/) do
  expect(@driver.find_element(:id, 'SIvob').text).to be "Fail Test"
end

And(/^I search for (.*)$/) do |keyword|
  @driver.find_element(:css,'[name="q"]').send_keys(keyword)
  @driver.action.send_keys(:enter).perform
end

Then(/^I verify (.*) in the search result page$/) do |result|
  expect(@driver.page_source.include? result).to be true
end