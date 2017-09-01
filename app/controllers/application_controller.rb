class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  Tmdb::Api.key("cc4b67c52acb514bdf4931f7cedfd12b")
end
