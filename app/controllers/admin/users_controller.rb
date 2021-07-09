class Admin::UsersController < ApplicationController
  before_action :user_find_by_id, only:[:edit, :update, :destroy, :task]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = Admin::User.page(params[:page]).per(3)
  end
  
  def new
    @user = Admin::User.new
  end
  
  def create
    @user = Admin::User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('user_relate.add_success')
      if current_user.admin?
        redirect_to admin_list_user_path
      else
        redirect_to admin_login_path
      end
    else
      flash[:error] = I18n.t('user_relate.add_fails')
      render :action => :admin_new
    end
  end
  
  def edit
    current_user = current_user
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = I18n.t('user_relate.edit_success')
      redirect_to :admin_edit_user, :id => @user
    else
      render :admin_admin_edit
    end
      debugger
  end
  
  def destroy
    Admin::User.find(params[:id]).destroy
    flash[:success] = I18n.t('user_relate.delete_success')
    redirect_to admin_list_user_path
  end
  
  private

  def user_params
    params.require(:admin_user).permit(:username, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:error] = "Please log in."
      redirect_to admin_login_url
    end
  end

  def correct_user
    @user = Admin::User.find(params[:id])
    redirect_to(admin_root_path) if @user != current_user && !current_user.admin?
  end

  def user_find_by_id
    @user = Admin::User.find(params['id'])
  end

  def admin_user
    redirect_to(admin_root_path) unless current_user.admin?
  end
end