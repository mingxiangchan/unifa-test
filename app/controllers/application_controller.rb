class ApplicationController < ActionController::Base
  before_action :check_current_user
  before_action :check_twitter_linked

  private

  def check_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def check_twitter_linked
    @twitter_linked = session[:oauth_access_token].present?
  end

  def require_login
    if @current_user.nil?
      flash[:error] = "You must be logged in to perform this action"
      redirect_to "/sessions/new"
    end
  end
end
