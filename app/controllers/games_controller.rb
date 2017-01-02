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

  def destroy
    game = Game.find params[:id]
    Game.clean_before_destroy(game)
    game.destroy
  end

  def create
    @game = Game.new game_params

    team_a_score = params[:game][:team_a_score]
    team_b_score = params[:game][:team_b_score]

    scores = update_goals(team_a_score, team_b_score)
    if scores.present?
      @game.add_goals_for(scores[:a], scores[:b])
      @game.add_goals_against(scores[:a], scores[:b])
      @game.add_points(scores[:a], scores[:b])
    end

    validate_game(@game)
    redirect_to_new(@err_message) unless @err_message.nil?
  end

  def show
    @game = Game.find params[:id]
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    game = Game.find params[:id]
    #game.update_attributes game_params
    team_a = game.team_a
    team_b = game.team_b

    new_score_a = params[:game][:team_a_score].to_i
    new_score_b = params[:game][:team_b_score].to_i

    if new_score_a.present? && new_score_b.present?
      # Deduct current Team goals for with the games current score
      game.subtract_goals_against(game.team_a_score, game.team_b_score)
      game.subtract_goals_for(game.team_a_score, game.team_b_score)

      # Adding the new figures
      game.add_goals_for(new_score_a, new_score_b)
      game.add_goals_against(new_score_a, new_score_b)

      game.edit_points(new_score_a, new_score_b)
      game.update game_params
    end


    validate_game(game)
    redirect_to_new(@err_message) unless @err_message.nil?
  end

  def destroy
    game = Game.find params[:id]
    game.clean_before_destroy

    game.destroy

    redirect_to games_results_path
  end

  private

  def game_params
    params.require(:game).permit(:team_a_id, :team_b_id, :team_a_score, :team_b_score, :game_date)
  end

  def redirect_to_new(message)
    flash[:error] = message
    render 'new'
  end

  def validate_game(game)
    if game.same_team?
      @err_message = "Error! Team cannot play itself!!"
    else
      if game.same_division?
        if game.save
          flash[:notice] = "Game was created successfully"
          redirect_to new_game_path
        end
      else
        @err_message = "Error! Teams in different divisions cannot be matched!! Check Divisions menu to match teams"
      end
    end
  end

  def update_goals(a, b)
    scores = Hash.new 0
    unless a.nil? && b.nil?
      scores[:a] = a.to_i
      scores[:b] = b.to_i

      scores
    end
  end

end
