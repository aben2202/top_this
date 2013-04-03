class ChangeCompletionDateToDateTime < ActiveRecord::Migration
  def up
  	change_column :route_completions, :completion_date, :datetime
  end

  def down
  	change_column :route_completions, :completion_date, :date
  end
end
