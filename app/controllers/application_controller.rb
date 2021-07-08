class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale] && I18n.available_locales.include?( params[:locale].to_s.to_sym )
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def split_order_cmds
    @split_order_cmds ||= params[:order].to_s.split
  end
  
  def sort_column
    Task.column_names.include?(split_order_cmds[0]) ? split_order_cmds[0] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(split_order_cmds[1]) ? split_order_cmds[1] : "asc"
  end
end
