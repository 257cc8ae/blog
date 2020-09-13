class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title,:thumbnail,:content, :name,:tags)
    redirect_to root_path
  end

  def show
    @post = Post.find_by(name: params[:id])
  end

  def edit
  end
end
