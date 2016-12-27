class AddPlayedToGames < ActiveRecord::Migration
  def change
    add_column :games, :played, :boolean, default: false
  end
end
