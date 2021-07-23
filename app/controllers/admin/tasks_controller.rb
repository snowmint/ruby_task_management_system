class Admin::TasksController < Admin::BaseController
  before_action :task_find_by_id, only:[:edit, :update, :destroy]
  before_action :instance_var,    only: [:index]
  
  def index
    @tasks = Task.where(user_id: params[:user_id]).page(params[:page]).per(5)
  end

  def instance_var
    @status_list = ["Pending", "In Progress", "Complete"]
    @priority_list = ["Urgent", "Highest", "High", "Normal", "Low", "Lowest"]
  end

end