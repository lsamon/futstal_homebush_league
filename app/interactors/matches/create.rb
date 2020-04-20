# frozen_string_literal: true

module Matches

	class Create < BaseInteractor
		requires :params

		before { context.params = params.with_indifferent_access }

		def call
			context.fail!(message: "Teams need to be in the same division") unless same_division?
			context.fail!(message: "Team cannot play itself") if first_team == second_team
			context.fail!(message: "Cannot play more than two games in a season with the same team") if match_count_exceeded?
			
			context.match = Match.create(
				start_at: params[:start_at],
				kind: params[:kind] || :trial
				)
			context.fail!(message: "Could not create match") if context.match.nil?

			create_match_stats
		end

		private

			def first_team
				first_team_id = params[:first_team_id]
				Team.find(first_team_id)
			rescue ActiveRecord::RecordNotFound
				context.fail!(message: "Team with id: #{first_team_id} was not found")
			end

			def second_team
				second_team_id = params[:second_team_id]
				Team.find(second_team_id)
			rescue ActiveRecord::RecordNotFound
				context.fail!(message: "Team with id: #{second_team_id} was not found")
			end

			def update_status
				return context.match.played! if context.match.ended?
				return context.match.in_progress! context.match.started?

				context.match.upcoming!
			end

			def same_division?
				# check if a trial match if it is return true
				return if params[:kind] == "trial"
				# check teams are in the same division
				first_team.division_id == second_team.division_id
			end

			def create_match_stats
				context.match.team_match_stats.create(
					[
						{ team: first_team, goals: params[:first_team_goals] || 0 },
						{ team: second_team, goals: params[:second_team_goals] || 0 }
					]
				)
			end

			def match_count_exceeded?
				match_count =
					first_team.maches
										.league
										.joins(:team_match_stats)
										.where("team_match_stats.team_id = ?", second_team.id)
										.count

				match_count > 2
			end

	end

end