class AddUserRouteIdsToRouteCompletions < ActiveRecord::Migration
  def change
    add_column :route_completions, :user_id, :integer
    add_column :route_completions, :route_id, :integer
  end
end
