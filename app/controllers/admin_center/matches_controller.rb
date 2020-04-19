# frozen_string_literal: true

module AdminCenter

	class MatchesController < AdminCenter::BaseController

		before_action :load_match, only: %i[show edit update]

		def index
			@matches = Match.joins(team_match_stats: :team).includes(team_match_stats: :team)
		end

		def new
			@match = Match.new
		end

		def create
			result = Matches::Create.call(params: params)
			
			if result.success?
				flash[:notice] = "Match created successfully"
			else
				flash[:error] = result.message
			end

			redirect_to admin_center_matches_path
		end

		def show; end

		def edit; end

		def update; end

		def destroy; end

		private

			def load_match
				@match ||= Match.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:error] = "Match with id #{params[:id]} not found"
				redirect_to admin_center_matches_path
			end

	end

end