# frozen_string_literal: true

module AdminCenter

	class TeamsController < AdminCenter::BaseController

		before_action :load_team, only: %i[show edit update add_player]

		def index
			@teams = Team.all
		end

		def new
			@team = Team.new
		end

		def create
			@team = Team.new(team_params)
			@team.save!(team_params)
			flash[:notice] = "Team created successfully"
			redirect_to admin_center_teams_path
		rescue StandardError => e
			flash[:alert] = e.message
			redirect_to admin_center_teams_path
		end

		def show
			@players = @team.players
			@other_players = Player.no_team
		end

		def edit; end

		def update
			@team.update(team_params)
			flash[:notice] = "Team information updated successfully"
			redirect_to admin_center_team_path(@team)
		rescue StandardError => e
			flash[:alert] = e.message
			redirect_to admin_center_team_path(@team)
		end

		def add_player
			players = Player.where(id: team_params[:player_ids])
			@team.players << players
			@team.save!
			flash[:notive] = "Add player to #{team.name}"
			redirect_to admin_center_team_path(@team, anchor: "#player")
		rescue StandardError
			flash[:alert] = "Could not add player to #{@team.name}"
			redirect_to admin_center_team_path(@team, anchor: "#player")
		end

		protected

			def load_team
				@team = Team.find(params[:id] || params[:team_id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Team with id: #{params[:id]} not found"
				redirect_to admin_center_teams_path
			end

			def team_params
				params.fetch(:team, {}).permit(:name, :division_id, :player_ids)
			end
		
	end

end