require 'rails_helper'

describe 'Routes for home' do
  it 'should route to home index' do
    expect(get: '/').to route_to(controller: 'duckrails/home', action: 'index')
  end
end
