class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    user_id = params[:user_id]
    @user = User.includes(posts: { comments: [:author] }).find(user_id)
    @posts = @user.posts
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
    author = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.author = author
    return unless @post.save

    redirect_to user_posts_path
  end

  def destroy
    Post.delete(params[:id])
    user = User.find(params[:user_id])
    user.posts_counter -= 1
    user.save
    redirect_to user_posts_path
  end

  private 

  def post_params 
    params.require(:post).permit(:title, :text)
  end
end
