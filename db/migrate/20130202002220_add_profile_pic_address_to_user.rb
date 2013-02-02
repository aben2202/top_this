class AddProfilePicAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic_address, :string
  end
end
