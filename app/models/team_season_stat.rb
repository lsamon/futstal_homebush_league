class TeamSeasonStat < ActiveRecord::Base
  belongs_to :season
  belongs_to :division
  belongs_to :team
end
