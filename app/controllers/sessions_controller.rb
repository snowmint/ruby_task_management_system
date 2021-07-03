class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session])
      #debugger
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      log_in user
      redirect_to show_user_path(session[:user_id])
    else
      #debugger
      flash[:error] = I18n.t('user_relate.invalid_login')
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out."
    redirect_to home_task_path
  end
end