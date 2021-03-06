class SessionsController < ApplicationController
  def new
    @user = User.new
    @errors = []
  end

  def create
    @user, @errors = LoginUser.new(user_params).run

    if @errors.empty?
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:oauth_access_token] = nil
    redirect_to "/sessions/new"
  end

  private

  def user_params
    params.require(:user).permit(:identifier, :password).to_h.symbolize_keys
  end
end
