class TasksController < ApplicationController
  def home
  end
  def index
    @tasks = Task.filtered(query_params).page(params[:page]).per(5)
    @tasks = case params[:order]
      when 'by_sort_create_time_desc'
        @tasks.order('created_at DESC')
      when 'by_sort_create_time_asc'
        @tasks.order('created_at ASC')

      when 'by_sort_priority_desc'
        @tasks.order('priority DESC')
      when 'by_sort_priority_asc'
        @tasks.order('priority ASC')

      when 'by_sort_status_desc'
        @tasks.order('status DESC')
      when 'by_sort_status_asc'
        @tasks.order('status ASC')

      when 'by_sort_start_time_desc'
        @tasks.order('start_time DESC')
      when 'by_sort_start_time_asc'
        @tasks.order('start_time ASC')

      when 'by_sort_end_time_desc'
        @tasks.order('end_time DESC')
      when 'by_sort_end_time_asc'
        @tasks.order('end_time ASC')
      
      when 'by_sort_id_desc'
        @tasks.order('id DESC')
      else
        @tasks.order('id ASC')
    end
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
    query_params ? query_params.permit(:keyword, :status, :priority) : {}
  end
end
  