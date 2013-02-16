class RemoveProfilePicAddressFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :profile_pic_address
  end

  def down
  	add_column :users, :profile_pic_address, :string
  end
end
