require 'rails_helper'

describe 'Routes for mocks' do
  it 'should route to mocks index' do
    expect(get: '/duckrails/mocks').to route_to(controller: 'duckrails/mocks', action: 'index')
  end

  it 'should route to mocks new' do
    expect(get: '/duckrails/mocks/new').to route_to(controller: 'duckrails/mocks', action: 'new')
  end

  it 'should route to mocks create' do
    expect(post: '/duckrails/mocks').to route_to(controller: 'duckrails/mocks', action: 'create')
  end

  it 'should route to mocks edit' do
    expect(get: '/duckrails/mocks/1/edit').to route_to(controller: 'duckrails/mocks', action: 'edit', id: '1')
  end

  it 'should route to mocks activate' do
    expect(put: '/duckrails/mocks/1/activate').to route_to(controller: 'duckrails/mocks', action: 'activate', id: '1')
  end

  it 'should route to mocks deactivate' do
    expect(put: '/duckrails/mocks/1/deactivate').to route_to(controller: 'duckrails/mocks', action: 'deactivate', id: '1')
  end

  it 'should route to mocks update' do
    expect(put: '/duckrails/mocks/1').to route_to(controller: 'duckrails/mocks', action: 'update', id: '1')
    expect(patch: '/duckrails/mocks/1').to route_to(controller: 'duckrails/mocks', action: 'update', id: '1')
  end

  it 'should route to mocks update order' do
    expect(put: '/duckrails/mocks/update_order').to route_to(controller: 'duckrails/mocks', action: 'update_order')
  end

  it 'should route to mocks destroy' do
    expect(delete: '/duckrails/mocks/1').to route_to(controller: 'duckrails/mocks', action: 'destroy', id: '1')
  end
end
