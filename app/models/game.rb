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

  # TODO: use `scope` instead
  def self.results
    Game.where('team_a_score IS NOT null or team_b_score IS NOT null')
  end

  def self.fixtures
    Game.where('team_a_score IS null or team_b_score IS null')
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

  def self.count_game(team_id)
    (Game.where{(team_a_id == team_id) | (team_b_id == team_id)}).count
  end

  def self.count_goals(team_id)
    games_per_team = Game.where{(team_a_id == team_id) | (team_b_id == team_id)}

    goals_for = 0
    goals_against = 0

    for_against = Hash.new 0

    games_per_team.each do |t|
      if t.team_a_id == team_id
        goals_for += t.team_a_score
        goals_against += t.team_b_score
      elsif t.team_b_id == team_id
        goals_for += t.team_b_score
        goals_against += t.team_a_score
      else
      end
    end

    for_against[:for] = goals_for
    for_against[:against] = goals_against
    for_against
  end

end
