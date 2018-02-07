require 'duckrails/synchronizer'

module Duckrails
  # The application state
  class ApplicationState < ActiveRecord::Base
    self.table_name = 'application_state'

    default_scope { order(id: :desc) }

    validates :singleton_guard, inclusion: { in: [0] }
    validates :mock_synchronization_token, presence: true

    def update_token(type)
      case type
      when :mock
        self.mock_synchronization_token = Synchronizer.generate_token
        save
      end
    end

    class << self
      # @return [ApplicationState] the one and only application state
      def instance
        ApplicationState.first || ApplicationState.create(singleton_guard: 0,
                                                          mock_synchronization_token: Synchronizer.generate_token)
      end
    end
  end
end
