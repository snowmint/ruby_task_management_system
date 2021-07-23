class Admin::TasksController < ApplicationController
  before_action :task_find_by_id, only:[:edit, :update, :destroy]

  def index
    # @tasks = Task.where("tasks.user_id = " + params['id']).page(params[:page]).per(5)
    @tasks = Task.where(user_id: params[:user_id]).page(params[:page]).per(5)
  end

end