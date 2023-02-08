require 'rails_helper'

RSpec.describe 'Users Index Page', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'David', photo: 'https://picsum.photos/id/237/200/300')
      @user2 = User.create(name: 'Amon', photo: 'https://picsum.photos/seed/picsum/200/300')
      visit users_path
    end

    it 'shows the right content' do
      expect(page).to have_content("David's blog app")
    end

    it 'shows username of all other users' do
      expect(page).to have_content('David')
      expect(page).to have_content('Amon')
    end

    it 'should show the profile picture for each user' do
      expect(page).to have_css("img[src*='https://picsum.photos/id/237/200/300']")
      expect(page).to have_css("img[src*='https://picsum.photos/seed/picsum/200/300']")
    end

    it 'should show the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'should redirect to user show page when clicked' do
      click_link('Amon')
      expect(page).to have_content('Amon')
    end
  end
end
