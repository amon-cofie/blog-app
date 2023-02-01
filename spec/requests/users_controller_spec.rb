require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    before(:each) { get '/users' }

    it 'should have status :success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render :index' do
      expect(response).to render_template(:index)
    end

    it 'should return the user with id' do
      expect(response.body).to include('Show all users')
    end
  end

  describe 'GET /users/:id' do
    before(:each) { get '/users/1' }

    it 'should have status :success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render :show' do
      expect(response).to render_template(:show)
    end

    it 'should return details of the user with id selected' do
      expect(response.body).to include('I am showing')
    end
  end
end
