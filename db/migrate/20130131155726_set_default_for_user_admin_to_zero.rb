class SetDefaultForUserAdminToZero < ActiveRecord::Migration
  def up
  	change_column :users, :admin_to, :integer, default: 0
  end

  def down
  	change_column :users, :admin_to, :integer, default: nil
  end
end
