class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @comment = Comment.new(
      text: params[:text],
      post: Post.find(params[:post_id]),
      author: User.find(params[:user_id])
    )

    return unless @comment.save

    redirect_to request.original_url
  end

  def destroy
    post = Post.find(params[:post_id])
    post.comments_counter -= 1
    Comment.delete(params[:id])
    post.save

    redirect_to user_posts_path
  end
end
