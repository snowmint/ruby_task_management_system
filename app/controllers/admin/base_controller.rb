class Admin::BaseController < ApplicationController
    layout 'backend'
    before_action :login_check
    before_action :admin_check

    def login_check
        if !logged_in?
            redirect_to admin_login_path, notice: "Please log in first!"
        end
    end

    def admin_check
        if !cureent_user.admin
            redirect_to admin_login_path, notice: "permission denied..."
        end
    end
end
