class Admin::UsersController < Admin::BaseController
    before_action :find_user, only: [:edit, :update, :destroy, :task]
    before_action :same_user_check, only: [:edit, :update, :destroy]
end