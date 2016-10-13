# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :text
#  division_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :division
  has_many :players
  has_many :games

  def games
    Team.games(self.id)
  end

  def self.games(team_id)
    Game.where('games.team_a_id = ? OR games.teams_b_id = ?', team_id, team_id)
  end
end
