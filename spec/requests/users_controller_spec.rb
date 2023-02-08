require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    before(:each) do
      @user = User.create(name: 'David', photo: 'https://picsum.photos/id/237/200/300',
                          bio: 'I want to make the world a better place')
      get '/users'
    end

    it 'should have status :success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render :index' do
      expect(response).to render_template(:index)
    end

    it 'should return the user with id' do
      expect(response.body).to include('David')
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
      expect(response.body).to include('I want to make the world a better place')
    end
  end
end
