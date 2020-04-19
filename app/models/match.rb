# frozen_string_literal: true

class Match < ActiveRecord::Base

	STATUSES =
		{
			upcoming: "upcoming",
			played: "played",
			in_progress: "in progress",
			postponed: "postponed",
			cancelled: "cancelled"
		}

	has_many :team_match_stats
	has_many :teams, through: :team_match_stats

	enum status: STATUSES
	enum kind: { league: "league", trial: "trial" }

	def ended?
		end_at < Time.current
	end

	alias :past? :ended?

	def started?
		return if past?

		start_time = actual_start_at || start_at

		start_time >= Time.current
	end

	def start_time
		actual_start_at || start_at
	end
end
