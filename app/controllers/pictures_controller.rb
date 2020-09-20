class PicturesController < ApplicationController
    def index
        @pictures = Picture.order(created_at: :desc).page(params[:page])
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
end
