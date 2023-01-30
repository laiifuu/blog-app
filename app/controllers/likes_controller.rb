class LikesController < ApplicationController
  def create
    @like = Like.new(
      post: Post.find(params[:post_id]),
      author: User.find(params[:author_id])
    )

    return unless @like.save

    redirect_to user_post_path(@like.author_id, @like.post_id)
  end
end
