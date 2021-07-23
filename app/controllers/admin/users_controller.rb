class Admin::UsersController < Admin::BaseController
  before_action :user_find_by_id, only:[:edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :is_last_admin,   only: [:destroy]

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
      if current_user.admin
        redirect_to admin_users_path
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
      redirect_to :edit_admin_user, :id => @user
    else
      render :edit
    end
  end

  def destroy
    delete_user = User.find(params[:id])
    delete_user.destroy
    flash[:success] = I18n.t('user_relate.delete_success')
    redirect_to admin_users_path
  end

  private
  

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user && !current_user.admin?
  end

  def user_find_by_id
    @user = User.find(params['id'])
  end

  def is_last_admin
    @admins = User.where(:admin => true)
    if @admins.size == 1
      flash[:error] = I18n.t('user_relate.at_least_one_admin')
      redirect_to admin_users_path
    end
  end
end