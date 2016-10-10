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
end
