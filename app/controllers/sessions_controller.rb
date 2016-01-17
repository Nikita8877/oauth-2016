class SessionsController < ApplicationController
  include SessionsHelper

  def create
    #render text: request.env['omniauth.auth'].to_yaml and return
    begin
      user = User.from_omniauth(request.env['omniauth.auth'])
    rescue
      flash[:warning] = "Can't authorize you..."
    else
      sign_in user
      flash[:success] = "Welcome, #{user.name}!"
    ensure
      redirect_to root_path
    end
  end

  def destroy
    sign_out if current_user
    flash[:success] = "See you!"
    redirect_to root_path
  end
end