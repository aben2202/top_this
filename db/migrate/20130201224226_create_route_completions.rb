class CreateRouteCompletions < ActiveRecord::Migration
  def change
    create_table :route_completions do |t|
      t.date :completion_date
      t.string :completion_type
      t.string :climb_type

      t.timestamps
    end
  end
end
