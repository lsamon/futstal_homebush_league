class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :teams_count

      t.timestamps null: false
    end
  end
end
