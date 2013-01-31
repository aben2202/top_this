class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
