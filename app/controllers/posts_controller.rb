class PostsController < ApplicationController
  before_action :basic_auth, except: [:index, :show]
  protect_from_forgery with: :exception

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title, :thumbnail, :content, :name, :tags)
    redirect_to post_path(@post.name)
  end

  def show
    @post = Post.find_by(name: params[:id])
    if Post.find_by(name: params[:id]) == nil
      redirect_to "/404.html"
    end
  end

  def edit
    @post = Post.find_by(name: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update params.require(:post).permit(:title, :thumbnail, :content, :name, :tags)
    redirect_to post_path(@post.name)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.dig(:basic, :username) && password == Rails.application.credentials.dig(:basic, :password)
    end
  end
end
