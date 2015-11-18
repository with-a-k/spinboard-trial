class MasterController < ApplicationController
  def index
    redirect_to links_path if cookies[:session]
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && params[:password] == params[:password_confirmation]
      cookies.signed[:session] = { user: user.id, expires: Time.now + 3600 }
      redirect_to links_path
    else
      flash[:whoops] = "That didn't work. Check your email and password again."
      redirect_to :back
    end
  end
end
