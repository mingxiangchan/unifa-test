class TweetsController < ApplicationController
  before_action :require_login

  def create
    picture = Picture.find(params[:picture_id])
    access_token = session["oauth_access_token"]

    response = HTTP.post(
      "https://arcane-ravine-29792.herokuapp.com/api/tweets",
      headers: { "Authorization": "Bearer #{access_token}", "Content-Type": "application/json" },
      body: JSON.generate({
        text: picture.title,
        url: url_for(picture.image),
      }),
    )

    redirect_to "/"
  end
end
