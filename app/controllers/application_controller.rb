class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_current_user
  
  protected # prevents method from being invoked by a route
  def set_current_user
      @current_user ||= User.find_by(id: session[:user_id])
      redirect_to root_path and return unless @current_user
  end
end
