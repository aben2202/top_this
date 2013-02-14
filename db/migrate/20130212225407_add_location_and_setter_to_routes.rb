class AddLocationAndSetterToRoutes < ActiveRecord::Migration
  def change
  	add_column :routes, :location, :string
  	add_column :routes, :setter, :string
  end
end
