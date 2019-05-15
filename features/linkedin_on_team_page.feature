Feature: linkedin links avalaible on team page
 As a team member of Bail Reform at Berkeley
 I want my linkedin on the team page
 So that people can get in contact with me

Scenario: Linkedin Links
 Given I am on the team page
 Then I should see "Tad Tobar"
 Then I should see clickable text "Tad Tobar" containing linkedin link
 # Then I should be on "http://www.linkedin.com"
