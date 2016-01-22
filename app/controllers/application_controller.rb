class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :require_login

  def require_login
    unless current_user
      redirect_to new_user_path
    end
  end

  include SessionsHelper
end
