class ChangeGoalsForAndGoalsAgainstInTeams < ActiveRecord::Migration
  def change
    change_column :teams, :goals_for, :integer, :default => 0
    change_column :teams, :goals_against, :integer, :default => 0
  end
end
