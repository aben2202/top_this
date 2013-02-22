class RemoveSetDateFromRoutes < ActiveRecord::Migration
  def up
  	remove_column :routes, :set_date
  end

  def down
  	add_column :routes, :set_date, :date
  end
end
