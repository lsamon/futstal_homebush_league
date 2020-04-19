# frozen_string_literal: true

class Division < ActiveRecord::Base
	has_many :teams
	has_many :team_season_stats

	validates :name, :number, presence: true
end
