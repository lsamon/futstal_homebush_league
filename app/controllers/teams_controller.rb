class TeamsController < ApplicationController
  before_action :check_for_admin, :only => ['new', 'edit', 'create', 'update']
  def new
    @team = Team.new
  end

  def create
    team = Team.create team_params

    redirect_to team
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find params[:id]
  end

  def edit
    @team = Team.find params[:id]
  end

  def update
    team = Team.find params[:id]
    team.update team_params

    redirect_to team
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to :action => 'index'
  end

  private
  def team_params
    params.require(:team).permit(:name, :division_id)
  end
end
