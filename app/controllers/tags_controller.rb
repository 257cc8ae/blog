class TagsController < ApplicationController
  before_action :basic_auth, except: [:index, :show]
  protect_from_forgery with: :exception

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create params.require(:tag).permit(:name, :descriptions, :img)
    redirect_to tag_path(@tag.name)
  end

  def show
    @tag = Tag.find_by(name: params[:id])
    if Tag.find_by(name: params[:id]) == nil
      redirect_to "/404.html"
    end
  end

  def edit
    @tag = Tag.find_by(name: params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update params.require(:tag).permit(:name, :descriptions, :img)
    redirect_to tag_path(@tag.name)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "user" && password == "password"
    end
  end
end