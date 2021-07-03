class ApplicationController < ActionController::Base
    before_action :set_locale

    def set_locale
      # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
      if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
        session[:locale] = params[:locale]
      end
    
      I18n.locale = session[:locale] || I18n.default_locale
    end

    def sort_column
      if params[:order]
        Task.column_names.include?(params[:order].split()[0]) ? params[:order].split()[0] : "id"
      else
        Task.column_names.include?("id") ? "id" : "id"
      end
    end
    
    def sort_direction
      if params[:order]
        %w[asc desc].include?(params[:order].split()[1]) ? params[:order].split()[1] : "asc"
      else
        %w[asc desc].include?("asc") ? "asc" : "asc"
      end
    end
    
    include SessionsHelper
end
