class UserController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to :action => :index
        else
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
end
