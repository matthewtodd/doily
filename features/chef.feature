Feature: Chef
  In order to get my chef server talking to a ruby-based fake couchdb
  As a compulsive yak shaver
  I want a ruby-based javascript interpreter that handles chef server views

  Background:
    Given these documents
      | chef_type | name               |
      | role      | application server |
      | role      | database server    |

  # Node, Role, OpenIDRegistration
  Scenario: show me Role all_id
    When get the 'all_id' view for 'Role'
    Then I should see these results
      | key                | value              |
      | application server | application server |
      | database server    | database server    |
