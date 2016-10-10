class GamesController < ApplicationController

  def index
    @games = Game.all
    # @game = Game.new
    # add_points
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create game_params
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

  def add_points
    team_a = Game.find params[:team_a_id]
    team_b = Game.find params[:team_b_id]
    team_a_score = params[:team_a_score]
    team_b_score = params[:team_b_score]

    if team_a_score > team_b_score
      team_a.points += 3
      team_a.save
    elsif team_a_score < team_b_score
      team_b.points += 3
      team_b.save
    else
      team_a.points += 1
      team_b.points += 1
      team_a.save
      team_b.save
    end
  end
end
