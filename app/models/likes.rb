class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :update_likes_counter

  private
  def update_likes_counter
    post_id = post.id
    Post.increment_counter(:likes_counter, post_id)
  end
end
