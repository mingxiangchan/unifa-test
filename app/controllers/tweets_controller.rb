class TweetsController < ApplicationController
  before_action :require_login

  def create
    picture = Picture.find(params[:picture_id])
    binding.pry
  end
end
