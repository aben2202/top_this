class AddBetaTypeToBeta < ActiveRecord::Migration
  def change
    add_column :beta, :beta_type, :string
  end
end
