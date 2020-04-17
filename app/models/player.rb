
# frozen_string_literal: true

class Player < User
	default_scope { player }

	belongs_to :team, counter_cache: true

	scope :no_team, -> { where(team_id: nil) }
	scope :not_in_division, ->(division_id) { joins(:team).where("teams.division_id != ?", division_id) }

	def name
		# TODO: Decorative method. Add to helper function or presenter instead
		"#{first_name} #{last_name}"
	end

	def team_name
		team&.name
	end
end
