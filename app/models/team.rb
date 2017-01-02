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
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  before_save :update_goal_difference

  belongs_to :division
  has_many :players
  has_many :games, dependent: :destroy

  def games
    Game.where('games.team_a_id = ? OR games.team_b_id = ?', id, id)
  end

  def update_goal_difference
    self.goal_difference = self.goals_for - self.goals_against
  end

  def add_win_points
    self.points += 3
    save
  end

  def subtract_win_points
    self.points -= 3
    save
  end

  def add_draw_points
    self.points += 1
    save
  end

  def subtract_draw_points
    self.points -= 1
    save
  end

end
