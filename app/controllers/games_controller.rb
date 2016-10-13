class GamesController < ApplicationController
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

    if team_a_id.present? && team_b_id.present?
      if team_a_id != team_b_id
        team_a_div = (Team.find team_a_id).division.division_number
        team_b_div = (Team.find team_b_id).division.division_number

        if team_a_div == team_b_div
          @game.save
          # Game.add_points(@game)
          redirect_to @game
        else
          redirect_to_new("Error! Teams in different divisions cannot be matched!! Check Divisions menu to match teams")
        end
      else
        redirect_to_new("Error! Team cannot play itself!!")
      end
    else
      redirect_to_new("Error! Both Teams need to be set to have a match!!")
    end

  end

  def show
    @game = Game.find params[:id]
  end

  def edit
  end

  def destroy
  end
  private

  def game_params
    params.require(:game).permit(:team_a_id, :team_b_id, :team_a_score, :team_b_score, :game_date)
  end

  def check_divisions
  end

  def check_same_team
  end

  def redirect_to_new(message)
    flash[:error] = message
    render 'new'
  end
end
