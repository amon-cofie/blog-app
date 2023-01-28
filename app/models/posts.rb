class Post < ApplicationRecord
  after_create :posts_counter_update
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def recent_comments(id)
    Comments.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def posts_counter_update
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end
end
