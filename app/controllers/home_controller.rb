class HomeController < ApplicationController
  def index
    @posts = Post.last(4).reverse
    @tags = Tag.last(10).reverse
  end

  def show
  end

  def about
    
  end
end
