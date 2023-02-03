class Post < ApplicationRecord
  after_create :posts_counter_update
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments(id)
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def posts_counter_update
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end
end
