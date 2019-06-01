class ApplicationController < ActionController::Base
  before_action :check_current_user

  private

  def check_current_user
    @current_user = User.find_by(id: session[:user_id])
    @current_user.present?
  end
end
