require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /posts' do
    before(:each) { get '/users/1/posts/' }

    it 'should have status :success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render :index' do
      expect(response).to render_template(:index)
    end

    it 'should return the list of posts of user with id' do
      expect(response.body).to include('These are the users posts')
    end
  end

  describe 'GET /posts/:id' do
    before(:each) { get '/users/1/posts/1/' }

    it 'should have status :success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render :show' do
      expect(response).to render_template(:show)
    end

    it 'should return details of the post with id selected' do
      expect(response.body).to include('This is the post with the id presented')
    end
  end
end
