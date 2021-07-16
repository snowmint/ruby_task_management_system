class UsersController < ApplicationController
  before_action :user_find_by_id, only:[:edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    flash[:error] = "Permission denied"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('user_relate.add_success')
      redirect_to login_path
    else
      flash[:error] = I18n.t('user_relate.add_fails')
      render :action => :new
    end
  end

  def edit
    current_user = current_user
  end

  def update
    if @user.update(user_params)
      flash[:success] = I18n.t('user_relate.edit_success')
      redirect_to :edit_user, :id => @user
    else
      render :edit
    end
    #debugger
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.t('user_relate.delete_success')
    redirect_to list_user_path
  end

  private
  def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless
      current_user.admin?
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:error] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) if @user != current_user && !current_user.admin?
  end

  def user_find_by_id
    @user = User.find(params['id'])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
end
