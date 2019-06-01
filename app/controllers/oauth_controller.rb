class OauthController < ApplicationController
  before_action :require_login

  def new
    redirect_to OauthService.generate_url
  end

  def callback
    code = params[:code]
  end
end
