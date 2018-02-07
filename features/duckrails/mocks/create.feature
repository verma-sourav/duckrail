Feature: There is a page with options to create a mock

Background:
  * I visit the new mock page

@javascript
Scenario: I see all errors when submitting an empty form
  Then The mock form should not have errors
  When I submit the mock form
  Then The mock form should have errors
  And The General tab of the mock form should have errors
  And The Response body tab of the mock form should have errors
  And The General tab of the mock form should be selected
  And The name field of the mock form should have an error message "can't be blank"
  And The request method field of the mock form should have an error message "can't be blank"
  And The status field of the mock form should have an error message "can't be blank"
  And The route path field of the mock form should have an error message "can't be blank"
  When I click the Response body tab of the mock form
  Then The Response body tab of the mock form should be selected
  And The content type field of the mock form should have an error message "can't be blank"
  When I click the General tab of the mock form
  Then The General tab of the mock form should be selected
  When I fill in the name field of the mock form with value "Mock name"
  And I select the value "get" on the request method of the mock form
  And I fill in the status field of the mock form with value "200"
  And I fill in the route path field of the mock form with value "/cucumber/test"
  And I submit the mock form
  And The General tab of the mock form should not have errors
  And The Response body tab of the mock form should have errors
  And The Response body tab of the mock form should be selected
