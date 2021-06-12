class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
  
      if @task.save
        flash[:success] = "Add task successfully!"
        redirect_to root_path
      else
        flash[:error] = "Error occurred..."
        render :new
      end
    end
  
    def edit
      @task = Task.find_by(id: params[:id])
    end
  
    def update
      @task = Task.find_by(id: params[:id])
  
      if @task.update(task_params)
        flash[:success] = "Data update successfully!"
        redirect_to root_path
      else
        render :edit
      end
    end
  
    def destroy
      @task = Task.find_by(id: params[:id])
      @task.destroy if @task
        flash[:success] = "Data delete successfully!"
        redirect_to root_path
    end
  
    private
    def task_params
      params.require(:task).permit(:user_id, :task_name, :content, :start_time, :end_time, :priority, :status)
    end
  
  end
  