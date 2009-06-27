Feature: Chef Nodes
  In order to get my chef server talking to a ruby-based fake couchdb
  As a compulsive yak shaver
  I want a ruby-based javascript interpreter that handles the views necessary to retrieve Nodes

  Background:
    Given these documents
      | chef_type             | name                | attributes                              | run_list          |
      | 'node'                | 'malacandra'        | { 'fqdn' => 'malacandra.example.com' }  | ['a', 'b', 'c']   |
      | 'node'                | 'perelandra'        | { 'fqdn' => 'perelandra.example.com' }  | ['a', 'b']        |
      | 'node'                | 'thulucandra'       | { 'fqdn' => 'thulucandra.example.com' } | nil               |
      | 'openid_registration' | 'glarb_example_com' | 'do not matter'                         | 'does not matter' |

  Scenario: Getting all Nodes
    When I get the 'all' view for 'Node'
    Then I should see
      | key           | value                                                                                                                                    |
      | 'malacandra'  | { 'chef_type' => 'node', 'name' => 'malacandra', 'attributes' => { 'fqdn' => 'malacandra.example.com' }, 'run_list' => ['a', 'b', 'c'] } |
      | 'perelandra'  | { 'chef_type' => 'node', 'name' => 'perelandra', 'attributes' => { 'fqdn' => 'perelandra.example.com' }, 'run_list' => ['a', 'b'] }      |
      | 'thulucandra' | { 'chef_type' => 'node', 'name' => 'thulucandra', 'attributes' => { 'fqdn' => 'thulucandra.example.com' }, 'run_list' => nil }           |

  Scenario: Getting all Node ids
    When I get the 'all_id' view for 'Node'
    Then I should see
      | key           | value         |
      | 'malacandra'  | 'malacandra'  |
      | 'perelandra'  | 'perelandra'  |
      | 'thulucandra' | 'thulucandra' |

  Scenario: Getting all Node statuses
    When I get the 'status' view for 'Node'
    Then I should see
      | key           | value                                                                                                                                                                                                                                        |
      | 'malacandra'  | { 'name' => 'malacandra', 'fqdn' => 'malacandra.example.com', 'ipaddress' => 'Undefined', 'ohai_time' => 'Undefined', 'uptime' => 'Undefined', 'platform' => 'Undefined', 'platform_version' => 'Undefined', 'run_list' => ['a', 'b', 'c'] } |
      | 'perelandra'  | { 'name' => 'perelandra', 'fqdn' => 'perelandra.example.com', 'ipaddress' => 'Undefined', 'ohai_time' => 'Undefined', 'uptime' => 'Undefined', 'platform' => 'Undefined', 'platform_version' => 'Undefined', 'run_list' => ['a', 'b'] }      |
      | 'thulucandra' | { 'name' => 'thulucandra', 'fqdn' => 'thulucandra.example.com', 'ipaddress' => 'Undefined', 'ohai_time' => 'Undefined', 'uptime' => 'Undefined', 'platform' => 'Undefined', 'platform_version' => 'Undefined', 'run_list' => 'Undefined' }  |

  Scenario: Getting Nodes by run list
    When I get the 'by_run_list' view for 'Node'
    Then I should see
      | key | value      |
      | a   | malacandra |
      | b   | malacandra |
      | c   | malacandra |
      | a   | perelandra |
      | b   | perelandra |


