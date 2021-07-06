class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
  
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  def sort_column
    split_order = params[:order].split()
    Task.column_names.include?(split_order[0]) ? split_order[0] : "id"
  end
  
  def sort_direction
    split_order = params[:order].split()
    %w[asc desc].include?(split_order[1]) ? split_order[1] : "asc"
  end
end
