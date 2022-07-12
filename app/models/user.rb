class User < ApplicationRecord
  has_many :posts, foreign_key: :authorId
  has_many :comments, foreign_key: :authorId
  has_many :likes, foreign_key: :authorId

  def last_three_posts
    posts.includes(:author).order(created_at: :DESC).limit(3)
  end
end
