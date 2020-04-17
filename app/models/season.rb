class Season < ActiveRecord::Base
	has_many :team_season_stats
end
