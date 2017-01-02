class AddGoalDifferenceToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :goal_difference, :integer
  end
end
