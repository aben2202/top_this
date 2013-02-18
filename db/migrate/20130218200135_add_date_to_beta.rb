class AddDateToBeta < ActiveRecord::Migration
  def change
    add_column :beta, :date, :date
  end
end
