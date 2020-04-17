# frozen_string_literal: true

class Team < ActiveRecord::Base
  belongs_to :division, counter_cache: true
  has_many   :players
  has_many	 :match_stats, class_name: "TeamMatchStat"
  has_many	 :matches, through: :match_stats
  has_one    :season_stat, class_name: "TeamSeasonStat"

  validates :name, presence: true
end
