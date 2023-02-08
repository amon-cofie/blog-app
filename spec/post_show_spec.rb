require_relative 'rails_helper'

RSpec.describe 'Posts show Page', type: :system do
  describe 'post page' do
    before(:each) do
      @user = User.create(name: 'David', photo: 'https://picsum.photos/id/237/200/300',
                          bio: 'I want to make the world a better place')
      @post = Post.create(title: 'Post 1', text: 'Test post 1', author: @user)
      @comment = Comment.create(text: 'first test comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'second test comment', author: @user, post: @post)
      @like = Like.create(author: @user, post: @post)
      @like2 = Like.create(author: @user, post: @post)
      visit user_posts_path(@user, @post)
    end

    it 'shows the post\'s title.' do
      expect(page).to have_content('Post 1')
    end

    it 'shows the post\'s author.' do
      expect(page).to have_content('David')
    end

    it 'shows how many comments it has.' do
      expect(page).to have_content('2')
    end

    it 'shows how many likes it has.' do
      expect(page).to have_content('2')
    end

    it 'shows the post\'s body.' do
      expect(page).to have_content('Test post 1')
    end

    it 'shows username of each commentor.' do
      expect(page).to have_content('David')
    end

    it 'shows the comment each commentor left.' do
      expect(page).to have_content('first test comment')
    end
  end
end
