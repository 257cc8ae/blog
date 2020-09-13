class ApisController < ApplicationController
  def image
    image_file_name = params[:n]
    redirect_to helpers.asset_url(image_file_name)
  end
end
