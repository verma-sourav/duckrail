Then /^I should see a javascript confirmation with text '(.*)'$/ do |text|
  expect(page.driver.browser.switch_to.alert.text).to eq text
end
