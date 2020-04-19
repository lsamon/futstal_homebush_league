class AddMatchIdToTeamMatchStats < ActiveRecord::Migration
  def change
  	add_column :team_match_stats, :match_id, :integer, after: :team_id
  end
end
