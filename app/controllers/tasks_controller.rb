class TasksController < ApplicationController
  before_action :task_find_by_id, only:[:edit, :update, :destroy]

  def index
    @tasks = current_scope.filtered(query_params).page(params[:page]).per(5).order(sort_column + " " + sort_direction)
    @status_list = ["Pending", "In Progress", "Complete"]
    @priority_list = ["Urgent", "Highest", "High", "Normal", "Low", "Lowest"]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash.now[:success] = I18n.t('task_relate.add_success')
      redirect_to root_path
    else
      flash.now[:error] = I18n.t('task_relate.add_fails')
      render :new
    end
  end

  def edit
    @status_list = ["Pending", "In Progress", "Complete"]
    @priority_list = ["Urgent", "Highest", "High", "Normal", "Low", "Lowest"]
  end

  def show
    @tasks = Task.where("tasks.user_id = " + params['id']).page(params[:page]).per(5)
  end

  def update
    if @task.update(task_params)
      flash[:success] = I18n.t('task_relate.edit_success')
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy if @task
      flash[:success] = I18n.t('task_relate.delete_success')
      redirect_to root_path
  end

  private

  def current_scope
    current_user ? current_user.tasks : Task
  end

  def task_params
    params.require(:task).permit(:user_id, :task_name, :content, :start_time, :end_time, :priority, :status, :label_list)
  end

  def query_params
    query_params = params[:query]
    query_params ? query_params.permit(:keyword, :status, :priority, :user_id, :label_keyword) : {}
  end

  def task_find_by_id
    @task = current_scope.find(params['id'])
  end
end
  