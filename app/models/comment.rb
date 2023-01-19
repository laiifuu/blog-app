class Comment < ApplicationRecord
  after_create :update_comments_counter

  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :post

  def update_comments_counter
    post_id = post.id
    Post.increment_counter(:comments_counter, post_id)
  end
end
