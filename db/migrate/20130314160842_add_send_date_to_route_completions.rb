class AddSendDateToRouteCompletions < ActiveRecord::Migration
  def change
    add_column :route_completions, :send_date, :datetime
  end
end
