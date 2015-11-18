class Api::V1::LinksController < ApplicationController
  respond_to :json

  def update
    respond_with Link.find_by(id: params[:id]).update!(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:read)
  end
end
