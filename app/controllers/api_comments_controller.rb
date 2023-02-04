class ApiCommentsController < ApiController
  def return_comments
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create_comment
    text = params[:text]
    post_id = params[:post_id]
    user_id = params[:author_id]
    if User.exists?(user_id) && Post.exists?(post_id)
      comment = Comment.create(text:, author_id: user_id, post_id:)
      render json: comment, status: :created
    else
      render json: 'Cannot create the comment', status: :unprocessable_entity
    end
  end
end
