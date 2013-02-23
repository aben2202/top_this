class RemoveBetaAnsweredFromBeta < ActiveRecord::Migration
  def up
    remove_column :beta, :beta_answered
  end

  def down
    add_column :beta, :beta_answered, :string
  end
end
