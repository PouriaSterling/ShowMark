Feature: As a user
  So that I can add keep track of where I'm up to
  I want to add a show to the application
  
  Background:
    Given I am on the home page
    Then I follow "New Show"
    
#######################ONE OR MORE EMPTY FIELDS#################################
  Scenario: I submit an empty form
    When I press "Save"
    Then I should see "Please complete all fields"
    
  Scenario: I leave name empty and fill in other two
    When I fill in "show_season" with "1"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should see "Please complete all fields"
  
  Scenario: I leave season empty and fill in other two
    When I fill in "show_name" with "Suits"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should see "Please complete all fields"
  
  Scenario: I leave episode empty and fill in other two
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "1"
    And I press "Save"
    Then I should see "Please complete all fields"
    
########################GIBBERISH AND NEGATIVES#################################
  Scenario: I try to add a giberish show
    When I fill in "show_name" with "xxxxx"
    And I fill in "show_season" with "1"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should see "Show doesn't exist"
  
  Scenario: I try to add a valid show with a negative season
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "-1"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should see "Season out of bounds"

  Scenario: I try to add a valid show with a negative episode
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "1"
    And I fill in "show_episode" with "-1"
    And I press "Save"
    Then I should see "Episode out of bounds"

  Scenario: I try to add a valid show with a negative season and episode
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "-1"
    And I fill in "show_episode" with "-1"
    And I press "Save"
    Then I should see "Season out of bounds"
    
#############################SEASON OR EPISODE TOO LARGE########################
  Scenario: I try to add a valid show with too many seasons
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "100"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should see "Season out of bounds"
    
  Scenario: I try to add a valid show with too many episodes
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "1"
    And I fill in "show_episode" with "100"
    And I press "Save"
    Then I should see "Episode out of bounds"

  Scenario: I try to add a valid show with too many seasons and episodes
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "100"
    And I fill in "show_episode" with "100"
    And I press "Save"
    Then I should see "Season out of bounds"
    
###################################CORRECT######################################
  Scenario: I try to add a valid show with valid season and episode
    When I fill in "show_name" with "Suits"
    And I fill in "show_season" with "1"
    And I fill in "show_episode" with "1"
    And I press "Save"
    Then I should be on the home page
    