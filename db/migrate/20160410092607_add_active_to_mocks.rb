class AddActiveToMocks < ActiveRecord::Migration
  def change
    add_column :mocks, :active, :boolean, null: false, default: true
  end
end
