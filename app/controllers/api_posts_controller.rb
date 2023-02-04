class ApiPostsController < ApiController
  def return_posts
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end
end