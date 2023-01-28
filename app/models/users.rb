class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  def recent_posts(id)
    Post.where(author_id: id).oder(created_at: :desc).limit(3)
  end
end
