class HomeController < ApplicationController
  def index
    @posts = Post.last(4).reverse
    response = []
    @posts.each_with_index do |post, i|
      tags = []
      post.tags.split().each do |tag|
        tags.push(tag)
      end
      rs = {
        "title": post.title,
        "date": post.created_at.to_s(:long),
        "tags": tags,
        "thumbnail": if i == 0
          post.thumbnail
        else
          ""
        end
      }
      response.push(rs)
    end

    render :json => response
  end

  def show
  end

  def about
  end
end
