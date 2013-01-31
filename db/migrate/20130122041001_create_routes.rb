class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :rating
      t.date :set_date
      t.date :retirement_date

      t.timestamps
    end
  end
end
