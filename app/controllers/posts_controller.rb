class PostsController < ApplicationController
  def show
    user_id = params[:id].to_i
    # puts :users[user_id].posts
    @posts = Post.where(user_id == :author_id)
  end
end
