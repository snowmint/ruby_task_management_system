class Admin::BaseController < ApplicationController
  before_action :login_check
  before_action :admin_check

  def login_check
    if !logged_in?
      redirect_to login_path, notice: "Please log in first!"
    end
  end

  def admin_check
    if !current_user.admin
      redirect_to root_path, notice: "permission denied..."
    end
  end

  def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless
    current_user.admin?
  end
end
