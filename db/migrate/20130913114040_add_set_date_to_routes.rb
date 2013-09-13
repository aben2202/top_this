class AddSetDateToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :set_date, :datetime
  end
end