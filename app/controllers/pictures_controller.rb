class PicturesController < ApplicationController
  def new
    @picture = Picture.new
    @errors = []
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user

    if @picture.save
      redirect_to "/"
    else
      @errors = @picture.errors.full_messages
      render :new
    end
  end

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
