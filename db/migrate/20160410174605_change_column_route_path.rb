class ChangeColumnRoutePath < ActiveRecord::Migration
  def change
    remove_index :mocks, :request_method_and_route_path
  end
end
