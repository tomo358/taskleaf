class ApplicationController < ActionController::Base
  before_method :current_user
  helper_method :current_user

  private

  def login_required
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
