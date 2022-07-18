require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/pages/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /posts' do
    it 'returns http success' do
      get '/pages/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/pages/index'
      expect(response).to have_http_status(:success)
    end
  end
end
