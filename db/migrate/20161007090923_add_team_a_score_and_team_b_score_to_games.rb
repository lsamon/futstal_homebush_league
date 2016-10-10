class AddTeamAScoreAndTeamBScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :team_a_score, :integer
    add_column :games, :team_b_score, :integer
  end
end
