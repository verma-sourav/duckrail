class RenameMockMethodColumnName < ActiveRecord::Migration
  def change
    rename_column :mocks, :method, :request_method
  end
end
