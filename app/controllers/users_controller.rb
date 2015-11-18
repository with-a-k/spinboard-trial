class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.create(user_params)
    if user.valid?
      cookies.signed[:session] = { user: user.id, expires: Time.now + 3600 }
      redirect_to links_path
    else
      flash[:whoops] = "Couldn't sign you up. Someone else is using that email address, or your password didn't match its confirmation."
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
