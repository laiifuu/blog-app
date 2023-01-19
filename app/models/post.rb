class Post < ApplicationRecord
  after_create :update_posts_counter

  belongs_to :user
  has_many :likes
  has_many :comments

  def update_posts_counter
    user_id = user.id
    User.increment_counter(:posts_counter, user_id)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
