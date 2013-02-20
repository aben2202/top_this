class RemoveDateFromBeta < ActiveRecord::Migration
  def up
    remove_column :beta, :date
  end

  def down
    add_column :beta, :date, :string
  end
end
