class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update] 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('user_relate.add_success')
      redirect_to :action => :new
    else
      flash[:error] = I18n.t('user_relate.add_fails')
      render :action => :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      if @user.update(user_params)
        flash[:success] = I18n.t('user_relate.edit_success')
        redirect_to :action => :edit, :id => @user
      else
        render :action => :edit
      end
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:error] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
