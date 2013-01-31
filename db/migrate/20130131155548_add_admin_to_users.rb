class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_to, :integer
  end
end
