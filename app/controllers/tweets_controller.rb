class TweetsController < ApplicationController
  before_action :require_login

  def create
    picture = Picture.find(params[:picture_id])
    access_token = session["oauth_access_token"]

    upload_success = TweetsService.submit_image({
      access_token: access_token,
      image_title: picture.title,
      image_url: url_for(picture.image),
    })

    if upload_success
      flash[:success] = "Image submitted to Fake Twitter successfully"
    else
      flash[:error] = "An error occured submitting the image to Fake Twitter"
    end

    redirect_to "/"
  end
end
