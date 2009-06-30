Feature: Chef OpenID Registrations
  In order to get my chef server talking to a ruby-based fake couchdb
  As a compulsive yak shaver
  I want a ruby-based javascript interpreter that handles the views necessary to retrieve OpenIDRegistrations

  Background:
    Given these documents
      | chef_type             | name              | validated         |
      | 'openid_registration' | 'unvalidated_org' | false             |
      | 'openid_registration' | 'validated_org'   | true              |
      | 'role'                | 'foo'             | 'does not matter' |

  Scenario: Parsing the OpenIDRegistration Design Document
    When I parse the design document for 'OpenIDRegistration'
    Then I should see
      | key        |
      | 'language' |
      | 'version'  |
      | 'views'    |

  Scenario: Coverage
    When I list all the views for 'OpenIDRegistration'
    Then I should see
      | key           |
      | 'all'         |
      | 'all_id'      |
      | 'unvalidated' |
      | 'validated'   |

  Scenario: Getting all OpenID Registrations
    When I get the 'all' view for 'OpenIDRegistration'
    Then I should see
      | key               | value                                                                                       |
      | 'unvalidated_org' | { 'chef_type' => 'openid_registration', 'name' => 'unvalidated_org', 'validated' => false } |
      | 'validated_org'   | { 'chef_type' => 'openid_registration', 'name' => 'validated_org', 'validated' => true }    |

  Scenario: Getting all OpenID Registration ids
    When I get the 'all_id' view for 'OpenIDRegistration'
    Then I should see
      | key               | value             |
      | 'unvalidated_org' | 'unvalidated_org' |
      | 'validated_org'   | 'validated_org'   |

  Scenario: Getting validated OpenID Registrations
    When I get the 'validated' view for 'OpenIDRegistration'
    Then I should see
      | key             | value                                                                                    |
      | 'validated_org' | { 'chef_type' => 'openid_registration', 'name' => 'validated_org', 'validated' => true } |

  Scenario: Getting unvalidated OpenID Registrations
    When I get the 'unvalidated' view for 'OpenIDRegistration'
    Then I should see
      | key               | value                                                                                       |
      | 'unvalidated_org' | { 'chef_type' => 'openid_registration', 'name' => 'unvalidated_org', 'validated' => false } |
