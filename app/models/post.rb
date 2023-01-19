class Post < ApplicationRecord
  after_create :update_posts_counter

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  def update_posts_counter
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
