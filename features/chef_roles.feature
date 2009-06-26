Feature: Chef Roles
  In order to get my chef server talking to a ruby-based fake couchdb
  As a compulsive yak shaver
  I want a ruby-based javascript interpreter that handles the views necessary to retrieve Roles

  Background:
    Given these documents
      | chef_type  | name                 |
      | 'role'     | 'application server' |
      | 'role'     | 'database server'    |
      | 'not_role' | 'glarb'              |

  Scenario: Getting all Roles
    When I get the 'all' view for 'Role'
    Then I should see
      | key                  | value                                                     |
      | 'application server' | { 'chef_type' => 'role', 'name' => 'application server' } |
      | 'database server'    | { 'chef_type' => 'role', 'name' => 'database server' }    |

  Scenario: Getting all Role ids
    When I get the 'all_id' view for 'Role'
    Then I should see
      | key                  | value                |
      | 'application server' | 'application server' |
      | 'database server'    | 'database server'    |
