class PlayersController < ApplicationController
  before_action :check_for_user, :only => [:edit, :update]
  before_action :check_for_admin, :only => [:index]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
  end

  def create
    @player = Player.new player_params

    if @player.save
      session[:player_id] = @player.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @player = @current_player
  end

  def update
    # :email, :dob, :image, :name, :password, :password_confirmation
    player = @current_player

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])

      player.image = req['public_id']
    end

    player.update_attributes player_params
    player.save
    redirect_to player

  end

  def destroy
  end

  private
  def player_params
    params.require(:player).permit(:email, :dob, :name, :password, :password_confirmation)
  end
end
