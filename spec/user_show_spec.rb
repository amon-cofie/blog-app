require_relative 'rails_helper'

RSpec.describe 'Users Show Page', type: :system do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'David', photo: 'https://picsum.photos/id/237/200/300',
                          bio: 'I want to make the world a better place')
      @post = Post.create(title: 'Post 1', text: 'Test post 1', author: @user)
      @post2 = Post.create(title: 'Post 2', text: 'Test is post 2', author: @user)
      @post3 = Post.create(title: 'Post 3', text: 'Test is post 3', author: @user)
      @post4 = Post.create(title: 'Post 4', text: 'Test is post 4', author: @user)
      visit user_path(@user)
    end

    it 'shows the users profile picture' do
      expect(page).to have_css("img[src*='https://picsum.photos/id/237/200/300']")
    end

    it 'shows the users username' do
      expect(page).to have_content('David')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'shows the users bio' do
      expect(page).to have_content('I want to make the world a better place')
    end

    it 'shows the users 3 recent posts' do
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
      expect(page).to have_content('Post 4')
    end

    it 'shows a button that lets me view all of a users posts' do
      expect(page).to have_link('See all posts')
    end

    it 'redirects me to the users posts index page when I click the button' do
      click_link('See all posts')
      expect(page).to have_content('David')
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Post 1')
    end

    # When I click a user's post, it redirects me to that post's show page.
    it 'redirects me to the post show page when I click a post' do
      click_link('See all posts')
      # click_link('Post 1')
      find(:link, 'Post 1', match: :first).click
      expect(page).to have_content('Post 1')
    end
  end
end
