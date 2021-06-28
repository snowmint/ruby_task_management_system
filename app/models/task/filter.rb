class Task::Filter

    def filter(scope, query_params)
      if query_params[:keyword].present?
        scope = scope.where("task_name ILIKE :search", search: "%#{query_params[:keyword]}%")
      end
  
      unless query_params[:status].nil? || query_params[:status] == ''
        scope = scope.where(status: query_params[:status])
      end
  
      if query_params[:priority].present?
        scope = scope.where(priority: query_params[:priority])
      end
  
      scope
    end
  
  end