class AddBetaAnsweredAsIntToBeta < ActiveRecord::Migration
  def change
    add_column :beta, :beta_answered, :integer, default: 0
  end
end
