class PostsController < ApplicationController
  before_action :basic_auth, except: [:index, :show]
  protect_from_forgery with: :exception

  def index
    posts = Post.order(created_at: :desc).page(params[:page])
    posts_a = []
    
    posts.each do |post|
      tags = []
      post.tags.split().each do |tag|
        tags.push(tag)
      end
      rs = {
        "title": post.title,
        "date": post.created_at.to_s(:long),
        "tags": tags,
        "name": post.name
      }
      posts_a.push(rs)
    end
    response = {
      "next_page": posts.next_page,
      "posts": posts_a
    }
    render :json => response
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title, :thumbnail, :content, :name, :tags, :description)
    redirect_to post_path(@post.name)
  end

  def show
    @post = Post.find_by(name: params[:id])
    content = {
      "title": @post.title,
      "date": @post.created_at.to_s(:long),
      "thumbnail": @post.thumbnail,
      "content": helpers.render_markdown(@post.content),
      "tags": @post.tags.split().each do |tag|
        tag
      end,
    }
    render :json => content
  end

  def edit
    @post = Post.find_by(name: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update params.require(:post).permit(:title, :thumbnail, :content, :name, :tags, :description)
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
