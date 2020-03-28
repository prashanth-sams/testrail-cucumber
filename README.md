# testrail-cucumber
[![Gem Version](https://badge.fury.io/rb/testrail-cucumber.svg)](http://badge.fury.io/rb/testrail-cucumber)
> Sync `cucumber` automation test results with your testrail suite. Discover an example with Cucumber in this gem source.

### Features
- [x] Update test results in the existing test run
- [x] Create dynamic test run and update test results in it
- [x] Update multi-testrail cases's status from a single automation scenario
- [x] Delete/clean all the existing test runs in a project's suite before test run 
- [x] Skip specific test-runs from deletion, when `clean_testrun` is set `true`
- [x] Disable `testrail-rspec` execution on-demand
- [x] Support for environment variables to pass testrail config values

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'testrail-cucumber'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install testrail-cucumber
```

**Import the library in your `env.rb` file**
```
require 'testrail-cucumber'
```

## Usage

#### Update one or multiple case(s) at a time
Prefix testrail case id(s) on start of your cucumber scenario or scenario outline; say, `C860`
```
  @your_tag
  Scenario: C860 Verify the home page
    Given I navigate to "home" page
    Then I verify the home page
      
  Scenario: C860 C862 C863 Verify the home page
    Given I navigate to "home" page
    Then I verify the home page
  
  Scenario Outline: C853 Verify Google search
    And I search for <keyword>
    Then I verify <result> in the search result page

    Examples:
      | keyword | result     |
      | Jesus   | Jesus      |
      | Bible   | My saviour |
```

#### Configuration

1. Create a config file, `testrail_config.yml` in the project's parent folder
2. Enter the testrail details based on demand
3. To execute tests against the existing `Test Run`,
    ```yaml
    testrail:
      url: https://your_url.testrail.io/
      user: your@email.com
      password: ******
      run_id: 111
    ```
    Here, `run_id` is the dynamically generated id from your testrail account (say, `run_id: 111`)

4. To create a dynamic `Test Run` and to update results,
    ```yaml
    testrail:
      url: https://your_url.testrail.io/
      user: your@email.com
      password: ******
      project_id: 10
      suite_id: 110
    ```
    Here, `project_id` and `suite_id` are the dynamically generated id from your testrail account; `run_id` is optional in this case.

5. To delete all test-runs before execution,
    ```yaml
    testrail:
      url: https://your_url.testrail.io/
      user: your@email.com
      password: ******
      clean_testrun: true
      project_id: 10
      suite_id: 110
    ```
    Set, `clean_testrun: false` if you don't want to clean the existing test runs; but this keyword is optional.

6. Skip specific test-runs from deletion: set `clean_testrun: true` & `skip_testrun_ids: value, ...`
    ```yaml
    testrail:
      url: https://your_url.testrail.io/
      user: your@email.com
      password: ******
      clean_testrun: true
      skip_testrun_ids: 473, 475
      project_id: 10
      suite_id: 110
    ```
    Here, `skip_testrun_ids: value` is optional.

7. Disable `testrail-rspec` execution: set `allow: yes` 
    ```yaml
    testrail:
      url: https://your_url.testrail.io/
      user: your@email.com
      password: ******
      run_id: 111
      allow: no
    ```
    Here, `allow: yes` is optional. 

8. Use Environment variables to pass testrail config values 
    ```yaml
    testrail:
      url: ENV['URL']
      user: ENV['TESTRAIL_USER']
      password: ENV['TESTRAIL_PASSWORD']
      run_id: ENV['RUN_ID']
      clean_testrun: false
      project_id: 10
      suite_id: 110
    ```
    Example, `rake ./demo_spec.rb TESTRAIL_USER=your@email.com TESTRAIL_PASSWORD=****** RUN_ID=564 URL=https://your_url.testrail.io/` 

#### Hooks

Update the results through `Hooks` on end of each test
```
After do |scenario|
  TestrailCucumber::UpdateTestRails.new(scenario).upload_result
end
```

#### Is there any demo available for this gem?
Yes, you can use this `cucumber` demo as an example, https://github.com/prashanth-sams/testrail-cucumber/features
```
rake test
```