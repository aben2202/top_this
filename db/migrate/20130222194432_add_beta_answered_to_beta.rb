class AddBetaAnsweredToBeta < ActiveRecord::Migration
  def change
    add_column :beta, :beta_answered, :bool
  end
end
