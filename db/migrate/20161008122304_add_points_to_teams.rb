class AddPointsToTeams < ActiveRecord::Migration
  def change
    change_column :teams, :points, :integer, :default => 0
  end
end
