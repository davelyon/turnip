Feature: Table to list

  Scenario: A list of items
    Given there are the following monsters:
      | Name    | Hitpoints |
      | Blaaarg | 23        |
      | Moorg   | 12        |
    When I look around
    Then I should see these monsters:
      | Blaaarg |
      | Moorg   |
