class SessionController < ApplicationController
  layout 'login_signup'
  
  def new
  end

def create
    player = Player.find_by :email => params[:email]
    # raise params.inspect
    if player.present? && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to player_path(session[:player_id])
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_path
  end
end
