class Season < ActiveRecord::Base
	has_many :team_season_stats

	validates :start_date, :end_date, presence: true
end
