module Duckrails
  class Synchronizer
    cattr_accessor :mock_synchronization_token

    def initialize(app)
      @app = app
    end

    def call(env)
      application_state = Duckrails::ApplicationState.instance

      if Duckrails::Synchronizer.mock_synchronization_token != application_state.mock_synchronization_token
        Rails.logger.info 'Mock synchronization token missmatch. Syncronizing...'
        Router.reset!
        Duckrails::Synchronizer.mock_synchronization_token = application_state.mock_synchronization_token
        Rails.logger.info 'Mock synchronization completed.'
      end

      @status, @headers, @response = @app.call(env)

      [@status, @headers, @response]
    end

    class << self
      def generate_token
        SecureRandom.uuid
      end
    end
  end
end
