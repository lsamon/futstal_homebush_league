class CreateTeamSeasonStats < ActiveRecord::Migration
  def change
    create_table :team_season_stats do |t|
      t.references :season, index: true
      t.references :team, index: true
      t.integer :division_id
      t.integer :matches_played, null: false, default: 0
      t.integer :goals_scored, null: false, default: 0
      t.integer :goals_against, null: false, default: 0
      t.integer :points, null: false, default: 0

      t.timestamps null: false
    end
  end
end
