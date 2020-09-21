class PicturesController < ApplicationController
  before_action :basic_auth

  def index
    if params[:q] == nil
      @pictures = Picture.order(created_at: :desc).page(params[:page])
    else
      @pictures = Picture.where(["name LIKE ?", "%#{params[:q]}%"]).page(params[:page])
    end
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create params.require(:picture).permit(:name, :image)
    redirect_to @picture
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.credentials.dig(:basic, :username) && password == Rails.application.credentials.dig(:basic, :password)
    end
  end
end
