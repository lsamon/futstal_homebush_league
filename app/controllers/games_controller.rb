class GamesController < ApplicationController

  def index
    @games = Game.all
    # @game = Game.new
    # add_points
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
    game = Game.create game_params
    Game.add_points(game)

    redirect_to game
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
    params.require(:game).permit(:team_a_id, :team_b_id, :team_a_score, :team_b_score)
  end
end
