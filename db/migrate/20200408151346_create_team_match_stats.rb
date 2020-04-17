class CreateTeamMatchStats < ActiveRecord::Migration
  def change
    create_table :team_match_stats do |t|
      t.references :team, index: true
      t.integer :goals

      t.timestamps null: false
    end
  end
end
