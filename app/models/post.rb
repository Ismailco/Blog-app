class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :authorId
  has_many :comments, foreign_key: :postId
  has_many :likes, foreign_key: :postId

  after_save :update_posts_counter

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comments
    comments.includes(:post).order(created_at: :ASC).limit(5)
  end
end
