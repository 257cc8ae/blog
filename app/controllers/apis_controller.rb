class ApisController < ApplicationController
  layout false
  def image
    image_file_name = params[:n]
    redirect_to helpers.asset_url(image_file_name)
  end
  
  def name_check
    name = params[:name]
    if Post.find_by(name: name) == nil
      @result = true
    else
      @result = false
    end
  end
  def active_storage
    @picture = Picture.find(params[:id])
    redirect_to url_for(@picture.image)
  end
end
