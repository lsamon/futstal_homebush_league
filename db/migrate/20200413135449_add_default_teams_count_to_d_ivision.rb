class AddDefaultTeamsCountToDIvision < ActiveRecord::Migration
  def change
  	change_column :divisions, :teams_count, :integer, default: 0
  end
end
