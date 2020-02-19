Feature: Google search

  Background: Google Home page
    Given I navigate to Google home page

  Scenario: C845 Verify Google Home Page
    Then I verify the Google home page

  Scenario: C847 C850 Verify Google Home Page x2
    Then I fail to load Google home page

  Scenario Outline: C853 Verify Google search
    And I search for <keyword>
    Then I verify <result> in the search result page

    Examples:
      | keyword | result     |
      | Jesus   | Jesus      |
      | Bible   | My saviour |