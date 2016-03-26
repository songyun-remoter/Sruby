class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # app/controllers/application_controller.rb
  before_action :require_login

  # app/controllers/users_controller.rb
  skip_before_action :require_login, only: [:index, :new, :create]

  # app/controllers/user_sessions_controller.rb
  skip_before_action :require_login, except: [:destroy]

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

end
