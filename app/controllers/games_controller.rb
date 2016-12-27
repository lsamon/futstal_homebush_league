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

    # binding.pry
    team_a = Team.find params[:game][:team_a_id]
    team_b = Team.find params[:game][:team_b_id]

    # binding.pry

    team_a_score = params[:game][:team_a_score]
    team_b_score = params[:game][:team_b_score]

    scores = update_goals(team_a_score, team_b_score)
    if scores.present?
      team_a.subtract_goals_against(team_b_score)
      team_b.subtract_goals_against(team_a_score)

      # Adding the new figures
      team_a.add_goals_for(team_a_score)
      team_b.add_goals_for(team_b_score)

      Game.add_points(@game)
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

    new_score_a = params[:game][:team_a_score]
    new_score_b = params[:game][:team_b_score]

    if new_score_a.present? && new_score_b.present?
      # Deduct current Team goals for with the games current score
      team_a.subtract_goals(new_score_a,new_score_b)
      team_b.subtract_goals(new_score_b,new_score_a)

      # Adding the new figures
      team_a.add_goals(new_score_a,team_b_score)
      team_b.add_goals(team_b_score,team_a_score)

      Game.edit_points(game, team_a_score, team_b_score)
      game.update game_params
    end


    validate_game(game)
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

  def redirect_to_new(message)
    flash[:error] = message
    render 'new'
  end

  def validate_game(game)
    if game.same_team? == false
      if game.same_division?
        if game.save
          flash[:notice] = "Game was created Successfully"
          redirect_to new_game_path
        end
      else
        @err_message = "Error! Teams in different divisions cannot be matched!! Check Divisions menu to match teams"
      end
    else
      @err_message = "Error! Team cannot play itself!!"
    end
  end

  def update_goals(a, b)
    scores = Hash.new 0
    unless a.nil? && b.nil?
      scores[:score_a] = a.to_i
      scores[:score_b] = b.to_i

      scores
    end
  end

end
