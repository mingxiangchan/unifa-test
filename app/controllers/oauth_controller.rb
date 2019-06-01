class OauthController < ApplicationController
  before_action :require_login

  def new
    redirect_to TweetsService.generate_oauth_url
  end

  def callback
    code = params[:code]
    access_token = TweetsService.obtain_access_token(code)
    session[:oauth_access_token] = access_token
    redirect_to "/"
  end
end
