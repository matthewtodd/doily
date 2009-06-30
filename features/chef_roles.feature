Feature: Chef Roles
  In order to get my chef server talking to a ruby-based fake couchdb
  As a compulsive yak shaver
  I want a ruby-based javascript interpreter that handles the views necessary to retrieve Roles

  Background:
    Given these documents
      | chef_type             | name                 |
      | 'role'                | 'application server' |
      | 'role'                | 'database server'    |
      | 'openid_registration' | 'glarb_example_com'  |

  Scenario: Parsing the Role Design Document
    When I parse the design document for 'Role'
    Then I should see
      | key        |
      | 'language' |
      | 'version'  |
      | 'views'    |

  Scenario: Coverage
    When I list all the views for 'Role'
    Then I should see
      | key      |
      | 'all'    |
      | 'all_id' |

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
