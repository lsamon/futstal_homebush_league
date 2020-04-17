class AddDefaultPlayersCountToTeams < ActiveRecord::Migration
  def change
  	change_column :teams, :players_count, :integer, default: 0
  end
end
