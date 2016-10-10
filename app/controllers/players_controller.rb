class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def show
  end

  def create
    @player = Player.new player_params

    if @player.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @current_player.update player_params

    redirect_to @current_player
  end

  def destroy
  end

  private
  def player_params
    params.require(:player).permit(:email, :dob, :image, :name, :password, :password_confirmation)
  end
end
