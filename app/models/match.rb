# frozen_string_literal: true

class Match < ActiveRecord::Base
	has_many :team_match_stats
	has_many :teams, through: :team_match_stats
end
