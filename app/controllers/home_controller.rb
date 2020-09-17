class HomeController < ApplicationController
  def index
    @posts = Post.last(4).reverse
  end

  def show
  end

  def about
    
  end
end
