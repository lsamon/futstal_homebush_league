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

  def self.add_points(game)
    return if game.team_a_score.nil? || game.team_b_score.nil?
    if game.team_a_score > game.team_b_score
      game.team_a.points += 3
      # raise 'a wins'
    elsif game.team_a_score < game.team_b_score
      game.team_b.points += 3
      # raise 'b wins'

    else
      game.team_a.points += 1
      game.team_b.points += 1
      # raise 'draw wins'

    end
    game.team_a.save
    game.team_b.save
  end

  def self.edit_points(game, new_score_a, new_score_b)
      return if new_score_a.nil? || new_score_b.nil?
      if new_score_a > new_score_b && game.team_a_score < game.team_b_score
        game.team_a.points += 3
        game.team_b.points -= 3
        # raise 'a wins'
      elsif new_score_a < new_score_b && game.team_a_score > game.team_b_score
        game.team_b.points += 3
        game.team_a.points -= 3
        # raise 'b wins'

      elsif new_score_a == new_score_b && game.team_a_score < game.team_b_score
        game.team_a.points += 1
        game.team_b.points -= 2
        # raise 'draw wins'
      elsif new_score_a == new_score_b && game.team_a_score > game.team_b_score
        game.team_a.points -= 2
        game.team_b.points += 1
      else
        game.team_a.points -= 0
        game.team_b.points += 0
      end
      game.team_a.save
      game.team_b.save
    end


  # this method is just to initialise the points correctly after seeding
  def self.add_current_points
    Game.all.each do |game|
      if game.team_a_score > game.team_b_score
        game.team_a.points += 3
      elsif game.team_b_score > game.team_b_score
        game.team_b.points += 3
      else
        game.team_a.points += 1
        game.team_b.points += 1
      end
      game.team_a.save
      game.team_b.save
    end
  end

  def reset_score
    self.team_a_score = 0
    self.team_b_score = 0
    save
  end

  def update_score(score_a, score_b)
    self.team_a_score = score_a
    self.team_a_score = score_a
    save
  end

  def self.count_game(team_id)
    (Game.where("team_a_score IS NOT null and team_a_id = #{team_id} or team_b_score IS NOT null and team_b_id = #{team_id}")).count
  end

  def self.count_goals(team_id)
    games_per_team = Game.where{(team_a_id == team_id) | (team_b_id == team_id)}

    goals_for = 0
    goals_against = 0

    for_against = Hash.new 0

    games_per_team.each do |t|
      if t.team_a_id == team_id
        goals_for += t.team_a_score unless t.team_a_score.nil?
        goals_against += t.team_b_score unless t.team_b_score.nil?
      elsif t.team_b_id == team_id
        goals_for += t.team_b_score unless t.team_b_score.nil?
        goals_against += t.team_a_score unless t.team_a_score.nil?
      else
      end
    end

    for_against[:for] = goals_for
    for_against[:against] = goals_against
    for_against
  end

  def clean_before_destroy(game)
    if game.team_a_score.present? && game.team_b_score.present?
      # Reduce number of goals
      game.team_a.goals_for -= game.team_a_score
      game.team_a.goals_against -= game.team_b_score

      game.team_b.goals_for -= game.team_b_score
      game.team_b.goals_against -= game.team_a_score

      #reduce points

      if game.team_a.score > game.team_b.score
        game.team_a.points -= 3
      elsif game.team_a.score < game.team_b.score
        game.team_b.points -= 3
      else
        game.team_a.points -= 1
        game.team_b.points -= 1
      end
      game.team_a.save
      game.team_b.save
    end
  end

end
