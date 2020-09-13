class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title,:thumbnail,:content, :name,:tags)
    redirect_to root_path
  end

  def edit
  end
end
