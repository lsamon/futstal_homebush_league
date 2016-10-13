class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_player

    private

    def fetch_player
      if session[:player_id].present?
        @current_player = Player.find_by :id => session[:player_id]
      end

      session[:player_id] = nil unless @current_player.present?
    end

    def check_for_user
      redirect_to root_path unless @current_player.present?
    end

    def check_for_admin
      redirect_to root_path unless (@current_player.present? && @current_player.admin?)
    end
end
