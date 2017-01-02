# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  team_a_id    :integer
#  team_b_id    :integer
#  final_score  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_a_score :integer
#  team_b_score :integer
#

class Game < ActiveRecord::Base
  belongs_to :team_a, :class_name => 'Team', :foreign_key => 'team_a_id'
  belongs_to :team_b, :class_name => 'Team', :foreign_key => 'team_b_id'

  validates_presence_of :team_a, :team_b
  # validates_numericality_of :team_a_score, :greater_than_or_equal_to => 0
  # validates_numericality_of :team_b_score, :greater_than_or_equal_to => 0

  scope :results, -> { where('game_date < ?', DateTime.now) }
  scope :fixtures, -> { where('game_date > ?', DateTime.now) }

  def same_team?
    self.team_a == self.team_b
  end

  def same_division?
    self.team_a.division_id == self.team_b.division_id
  end

  def add_points(score_a, score_b)
    return if score_a.nil? || score_b.nil?
    if score_a > score_b
      self.team_a.points += 3
      # raise 'a wins'
    elsif score_a < score_b
      self.team_b.points += 3

    else
      self.team_a.points += 1
      self.team_b.points += 1

    end
    self.team_a.save
    self.team_b.save
  end

  def subtract_points(score_a, score_b)
    if score_a > score_b
      self.team_a.points -= 3
    elsif score_a < score_b
      self.team_b.points -= 3
    else
      self.team_a.points -= 1
      self.team_b.points -= 1
    end
    self.team_a.save
    self.team_b.save
  end

  def edit_points(new_score_a, new_score_b)
      return if new_score_a.nil? || new_score_b.nil?
      self.subtract_points(self.team_a_score, self.team_b_score)
      self.add_points(new_score_a, new_score_b)
    end

  def update_score(score_a, score_b)
    self.team_a_score = score_a
    self.team_a_score = score_a
    save
  end

  def self.count_game(team_id)
    (Game.where("team_a_score IS NOT null and team_a_id = #{team_id} or team_b_score IS NOT null and team_b_id = #{team_id}")).count
  end

  def clean_before_destroy
    if self.team_a_score.present? && self.team_b_score.present?
      # Reduce number of goals
      self.subtract_goals_for(self.team_a_score, self.team_b_score)
      self.subtract_goals_against(self.team_a_score, self.team_b_score)

      #reduce points
      self.subtract_points(self.team_a_score, self.team_b_score)

    end
  end


  def add_goals_for(new_score_a, new_score_b)
    self.team_a.goals_for += new_score_a
    self.team_b.goals_for += new_score_b
  end

  def subtract_goals_for(new_score_a, new_score_b)
    self.team_a.goals_for -= new_score_a
    self.team_b.goals_for -= new_score_b
  end

  def add_goals_against(new_score_a, new_score_b)
    self.team_a.goals_against += new_score_b
    self.team_b.goals_against += new_score_a
  end

  def subtract_goals_against(new_score_a, new_score_b)
    self.team_a.goals_against -= new_score_b
    self.team_b.goals_against -= new_score_a
  end

end
