class SearchesController < ApplicationController
  def index
    posts = Post.where(['title LIKE ?', "%#{params[:word]}%"]).or(Post.where(['content LIKE ?', "%#{params[:word]}%"])).or(Post.where(['tags LIKE ?', "%#{params[:word]}%"])).page(params[:page])
    posts.each do |post|
    render :json => posts
  end
end
