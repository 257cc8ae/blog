class PicturesController < ApplicationController
    def index
        if params[:q] == nil then
            @pictures = Picture.order(created_at: :desc).page(params[:page])
        else
            @pictures = Picture.where(['name LIKE ?', "%#{params[:q]}%"]).page(params[:page])
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
end
