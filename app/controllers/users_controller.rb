class UsersController < ApplicationController
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

  def update
      if @user.update(user_params)
        redirect_to :action => :show, :id => @user
      else
        render :action => :edit
      end
  end

  def show
    #@user = User.find(params[:id])
    #debugger
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
