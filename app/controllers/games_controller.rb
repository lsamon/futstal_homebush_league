class GamesController < ApplicationController
  attr_accessor :err_message
  before_action :check_for_admin, :only => ['new', 'edit', 'create', 'update']

  def index
    @games = Game.all
  end

  def fixtures
    @fixtures = Game.fixtures
  end

  def results
    @results = Game.results
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    team_a_id = params[:game][:team_a_id]
    team_b_id = params[:game][:team_b_id]

    validate_game(@game, team_a_id, team_b_id)
    redirect_to_new(@err_message) unless @err_message.nil?
  end

  def show
    @game = Game.find params[:id]
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    game = Game.update_attributes game_params
    team_a = game.team_a_id
    team_b = game.team_b_id

    validate_game(game, team_a_id, team_b_id)
    redirect_to_new(@err_message) unless @err_message.nil?
  end

  def destroy
    game = Game.find params[:id]
    game.destroy

    redirect_to games_fixtures_path
  end

  private

  def game_params
    params.require(:game).permit(:team_a_id, :team_b_id, :team_a_score, :team_b_score, :game_date)
  end

  # def check_divisions(teama,teamb, msg)
  # if teama.division_number == teamb.division_number
  #   redirect_to_new msg
  # end
  # end
  #
  # def check_same_team(teama, teamb, msg)
  #   if teama.id == teamb.id
  #     redirect_to_new msg
  #
  # end

  def redirect_to_new(message)
    flash[:error] = message
    render 'new'
  end

  def validate_game(game, team_a_id, team_b_id)
    if team_a_id.present? && team_b_id.present?
      if team_a_id != team_b_id
        team_a_div = (Team.find team_a_id).division.division_number
        team_b_div = (Team.find team_b_id).division.division_number

        if team_a_div == team_b_div
          game.save
          # Game.add_points(@game)
          redirect_to game
        else
          @err_message = "Error! Teams in different divisions cannot be matched!! Check Divisions menu to match teams"
        end
      else
        @err_message = "Error! Team cannot play itself!!"
      end
    else
      @err_message = "Error! Both Teams need to be set to have a match!!"
    end
  end

end
