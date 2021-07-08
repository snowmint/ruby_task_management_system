class UsersController < ApplicationController
  before_action :user_find_by_id, only:[:edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('user_relate.add_success')
      if current_user.admin?
        redirect_to list_user_path
      else
        redirect_to login_path
      end
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
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.t('user_relate.delete_success')
    redirect_to list_user_path
  end

  private

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

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
