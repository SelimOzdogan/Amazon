class ApplicationController < ActionController::Base
  private

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find session[:user_id] # ||= will only assign @current_user if it is nil. Otherwise continue using it's
    end
  end

  helper_method :current_user

  def authenticate_user!
    unless user_signed_in?
      flash[:alert] = "You must sign in or sign up first"
      redirect_to new_session_path
    end
  end
end
