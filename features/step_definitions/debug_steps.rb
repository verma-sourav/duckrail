And /^I wait for (\d*) seconds$/ do |seconds|
  sleep seconds.to_i
end

And /^I take a page screenshot$/ do
  Capybara::Screenshot.screenshot_and_open_image
end
