# frozen_string_literal: true

module AdminCenter

	class PlayersController < AdminCenter::BaseController

		before_action :load_player, only: %i[show edit update]

		def index
			@players = Player.all
		end

		def new
			@player = Player.new
		end

		def create
			@player = Player.create!(player_params)
			flash[:notice] = "Player created successfully"
			redirect_to admin_center_players_path
		rescue StandardError => e
			flash[:alert] = e.message
			redirect_to admin_center_players_path
		end

		def show; end

		def edit; end

		def update
			@player.update!(player_params)
			flash[:notice] = "Player information updated successfully"
			redirect_to admin_center_player_path(@player)
		rescue StandardError => e
			flash[:alert] = e.message
			redirect_to admin_center_player_path(@player)
		end

		protected

			def load_player
				@player = Player.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Player with id: #{params[:id]} not found"
				redirect_to admin_center_players_path
			end

			def player_params
				params.fetch(:player, {})
					  .permit(:first_name, :last_name, :email, :date_of_birth, :status, :team_id, :password, :password_confirmation)
			end
		
	end

end