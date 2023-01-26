class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
    @recent_user = current_user
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = Post.find(post_id)
    @comments = Comment.where(post_id:)
    @recent_user = current_user
  end

  def new 
    @post = Post.new
  end

  def create
    user = self.current_user
    puts user
    @post = Post.new(
      title: params[:post][:title], 
      text: params[:post][:text], 
      author: user
    )
    if @post.save
      redirect_to user_posts_path
    end
  end
end
