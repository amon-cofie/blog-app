require 'rails_helper'
RSpec.describe Post, type: :model do
  it 'checks that title is valid' do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    @post.title = 'Hello'
    expect(@post).to be_valid
  end

  # tests go here
  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid if title length is more that 250 characters' do
    post = Post.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end

  it 'is not valid if comments_counter is less than 0' do
    post = Post.new(comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is not valid if likes_counter is less than 0' do
    post = Post.new(likes_counter: -1)
    expect(post).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to author' do
      post = Post.reflect_on_association(:author)
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many likes' do
      post = Post.reflect_on_association(:likes)
      expect(post.macro).to eq(:has_many)
    end

    it 'has many comments' do
      post = Post.reflect_on_association(:comments)
      expect(post.macro).to eq(:has_many)
    end
  end
end
