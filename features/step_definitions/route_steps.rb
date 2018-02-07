When /^I visit the home page$/ do
  visit root_path
end

When /^I visit the mocks page$/ do
  visit duckrails_mocks_path
end

When /^I visit the new mock page$/ do
  visit new_duckrails_mock_path
end

Then /^I should be on the home page$/ do
  expect(page).to have_current_path(root_path)
end

Then /^I should be on the mocks page$/ do
  expect(page).to have_current_path(duckrails_mocks_path)
end

Then /^I should be on the new mock page$/ do
  expect(page).to have_current_path(new_duckrails_mock_path)
end

Then /^I should be on the edit mock page with id (\d*)$/ do |mock_id|
  expect(page).to have_current_path(edit_duckrails_mock_path(id: mock_id))
end
