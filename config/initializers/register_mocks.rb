require 'duckrails/router'

# Don't register mocks if there are pending migrations
Duckrails::Router.register_current_mocks unless ActiveRecord::Migrator.needs_migration?
