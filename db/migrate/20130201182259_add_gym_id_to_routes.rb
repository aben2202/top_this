class AddGymIdToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :gym_id, :integer
  end
end
