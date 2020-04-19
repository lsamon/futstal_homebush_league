class ChangeGoalsScoredToTeamSeasonStats < ActiveRecord::Migration
  def change
  	change_column :team_season_stats, :goals_scored, :integer
  end
end
