RSpec.configure do |config|
  config.after(:each) do
    Duckrails::Router::REGISTERED_MOCKS.clear
    Duckrails::Application.routes_reloader.reload!
  end
end
