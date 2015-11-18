class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.create(user_params)
    cookies.signed[:session] = { user: user.id, expires: Time.now + 3600 }
    redirect_to links_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
