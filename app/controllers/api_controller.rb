class ApiController < ApplicationController

  def return_posts
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end


  def return_comments
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create_comment
    text = params[:text]
    post_id = params[:post_id]
    comment = Comment.create(text: text, author: current_user, post_id: post_id)
    render json: comment, status: 200
  end
end
