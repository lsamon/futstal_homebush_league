class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :division, index: true
      t.string :name
      t.integer :players_count

      t.timestamps null: false
    end
  end
end
