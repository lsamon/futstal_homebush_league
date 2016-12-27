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
  has_many :games, dependent: :destroy

  def games
    Game.where('games.team_a_id = ? OR games.team_b_id = ?', id, id)
  end

  def add_goals_for(new_score)
    self.goals_for += new_score.to_i
    save
  end

  def subtract_goals_against(new_score)
    self.goals_against -= new_score.to_i
    save
  end
end
