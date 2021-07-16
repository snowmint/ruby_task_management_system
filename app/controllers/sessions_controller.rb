class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      log_in user
      redirect_to root_path(session[:user_id])
      #debugger
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

  private

  def set
    session[:checkbox] = role_checkbox[:session_setter]
    render :nothing => true
  end

end