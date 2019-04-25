Before do |scenario|
    @driver = Selenium::WebDriver.for :chrome
end

After do |scenario|
    TestrailCucumber::UpdateTestRails.new(scenario).upload_result

    @driver.quit
end