class ApplicationController < ActionController::Base
  private

  # returns current user if there is a current user
  def current_user
    if session[:user_id].present?
      @current_user ||= User.find session[:user_id] # ||= will only assign @current_user if it is nil. Otherwise continue using it's
    end
  end

  helper_method :current_user
end
