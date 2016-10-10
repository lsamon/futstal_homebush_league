class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :name
      t.integer :division_id

      t.timestamps null: false
    end
  end
end
