# testrail-cucumber
Sync Automation results with your testrail suite

#### Install gem file
```
gem 'testrail-cucumber'
```

#### Import the library in your env file
```
require 'testrail-cucumber'
```

#### Sync Case ID in your BDD scenario
Prefix TestRail Case ID on start of your cucumber scenario; say, C860
```
  @your_tag
  Scenario: C860 Verify the home page
    Given I navigate to "home" page
    Then I verify the home page
```

#### Config TestRail details

- Create a testrail config file, `testrail_config.yml` in the parent folder 
- Fill up the testrail details on right hand side of the fields (url, user, password, and run_id); the `run_id` has to be generated from the testrail account (say, 111)

```
testrail:
  url: https://your_url.testrail.io/
  user: your@email.com
  password: your_password
  run_id: your_run_id
```

#### Update the results through `Hooks` on end of each test
```
After do |scenario|
  TestrailCucumber::UpdateTestRails.new(scenario).upload_result
```