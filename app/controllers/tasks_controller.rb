class TasksController < ApplicationController

  def index
    @tasks = Task.by_user_id(session[:user_id]).filtered(query_params).page(params[:page]).per(5).order(sort_column + " " + sort_direction)
    #debugger
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
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      flash[:success] = I18n.t('task_relate.edit_success')
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy if @task
      flash[:success] = I18n.t('task_relate.delete_success')
      redirect_to root_path
  end
  
  private
  def task_params
    params.require(:task).permit(:user_id, :task_name, :content, :start_time, :end_time, :priority, :status)
  end

  def query_params
    query_params = params[:query]
    query_params ? query_params.permit(:keyword, :status, :priority, :user_id) : {}
  end
end
  