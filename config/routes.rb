require 'duckrails/router'

Rails.application.routes.draw do
  root 'duckrails/home#index'

  namespace 'duckrails' do
    resources :mocks, except: [:show] do
      member do
        put :activate
        put :deactivate
      end

      collection do
        put :update_order
      end
    end
  end

  Duckrails::Router.load_mock_routes!
end
