Feature: Article Merging
  As a blog administrator
  In order to share simplify the reading of my blog
  I want to be able to merge similar articles

  Background:
    Given the blog is set up    

  Scenario: A non-admin cannot merge articles
    Given I am logged as non-admin into the admin panel    
    Then the active user should be non-admin
	When I am on the new article page
	When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    And I follow "Foobar"    
    Then I should not see "Merge Articles"
	
	
  Scenario: When articles are merged, the merged article should contain the text of both previous, it should have one title, one author and all the comments
    Given I am logged as non-admin into the admin panel 
    When I am on the new article page
	When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
	And I log out
	When I am on the home page
	And I follow "Foobar"
	And I fill in "comment_author" with "Test author one"
	And I fill in "comment_body" with "Comment one"
	And I am logged into the admin panel
	When I am on the new article page
	When I fill in "article_title" with "Test title"
    And I fill in "article__body_and_extended_editor" with "Added Text"
    And I press "Publish"
	When I am on the home page
	And I follow "Test title"
	And I fill in "comment_author" with "Admin author"
	And I fill in "comment_body" with "Second note"
	When I am on the Foobar edit page	
	And I fill in "merge_with" with "2"
	And I press "Merge"
	Then I should see "user"
	And I should not see "admin"
	When I am on the home page
	And I follow "Foobar"
	Then I should see "Lorem Ipsum"
	And I should see "Added Text"
	And I should not see "Test title"
	And I should see "Comment one"
	And I should see "Second note"
	
	
	

	
