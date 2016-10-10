class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team_a_id
      t.integer :team_b_id
      t.text :final_score

      t.timestamps null: false
    end
  end
end
