require_relative 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do
  describe 'posts index page' do
    before(:each) do
      @user = User.create(name: 'David', photo: 'https://picsum.photos/id/237/200/300',
                          bio: 'I want to make the world a better place')
      @post = Post.create(title: 'Post 1', text: 'Test post 1', author: @user)
      @post2 = Post.create(title: 'Post 2', text: 'Test is post 2', author: @user)
      @post3 = Post.create(title: 'Post 3', text: 'Test is post 3', author: @user)
      @post4 = Post.create(title: 'Post 4', text: 'Test is post 4', author: @user)
      @comment = Comment.create(text: 'first test comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'second test comment', author: @user, post: @post)
      @like = Like.create(author: @user, post: @post)
      @like2 = Like.create(author: @user, post: @post)
      visit user_posts_path(@user)
    end

    it 'should show the profile picture for each user' do
      expect(page).to have_css("img[src*='https://picsum.photos/id/237/200/300']")
    end

    it 'should show the name of the user' do
      expect(page).to have_content('David')
    end

    it 'should show the number of the posts' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'should show the title of the post' do
      expect(page).to have_content('Test post 1')
    end

    it 'should show the post content' do
      expect(page).to have_content('Test is post 4')
    end

    it 'should show the first comment of a post' do
      expect(page).to have_content('first test comment')
    end

    it 'should show the number of comments for a particular post' do
      expect(page).to have_content('Comments: 0, Likes: 0')
    end

    it 'should show the number of likes for a particular post' do
      expect(page).to have_content('Comments: 0, Likes: 0')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      find(:link, 'Post 1', match: :first).click
      expect(page).to have_content('Test post 1')
    end
  end
end
