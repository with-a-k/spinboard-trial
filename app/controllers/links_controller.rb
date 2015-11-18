class LinksController < ApplicationController
  respond_to :html, :json

  def index
    @user = User.find_by(id: cookies.signed[:session])
    @links = Link.where(user_id: cookies.signed[:session])
    @new_link = Link.new(user_id: cookies.signed[:session])
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def create
    user = User.find_by(id: cookies.signed[:session])
    link = user.links.create(link_params)
    unless link.valid?
      flash[:whoops] = "Bad URL location. Please doublecheck that before trying again."
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :location, :user_id)
  end
end
