class TagsController < ApplicationController
  before_action :basic_auth, except: [:index, :show]
  protect_from_forgery with: :exception

  def new
    @tag = Tag.new
  end

  def index 
    tags = Tag.all.page(params[:page])
    ta_a = []
    tags.each do |tag|
      rs = {
        "name": tag.name,
        "descriptions": tag.descriptions
      }
      ta_a.push(rs)
    end
    response = {
      "next_page": tags.next_page,
      "tags": ta_a
    }
    render :json => response
  end

  def create
    @tag = Tag.create params.require(:tag).permit(:name, :descriptions)
    redirect_to tag_path(@tag.name)
  end

  def show
    
    posts = Post.where(['tags LIKE ?', "%#{params[:id]}%"]).page(params[:page])
    if Tag.find_by(name: params[:id]) == nil
      tag_name = params[:id]
      tag_descriptions = "Here are article related to #{params[:id]}."
    else 
      tag = Tag.find_by(name: params[:id])
      tag_name = tag.name
      tag_descriptions = tag.descriptions
    end
    response = {
      "name": tag_name,
      "descriptions": tag_descriptions,
      "posts": posts,
      "next_page": posts.next_page,
    }
    render :json => response
  end

  def edit
    @tag = Tag.find_by(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update params.require(:tag).permit(:name, :descriptions)
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
      username == Rails.application.credentials.dig(:basic, :username) && password == Rails.application.credentials.dig(:basic, :password)
    end
  end
end
