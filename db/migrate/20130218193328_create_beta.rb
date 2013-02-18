class CreateBeta < ActiveRecord::Migration
  def change
    create_table :beta do |t|
      t.integer :route_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
