class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      text: params[:text],
      post: Post.find(params[:post_id]),
      author: User.find(params[:user_id])
    )

    return unless @comment.save

    redirect_to request.original_url
  end
end
