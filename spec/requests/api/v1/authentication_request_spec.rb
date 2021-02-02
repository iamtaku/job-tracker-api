require 'rails_helper'

RSpec.describe "Api::V1::Authentications", type: :request do
 describe 'POST /authentication' do
    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: 'kaho99', password: 'password' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        'token' => '123'
      })

    end
    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { username: 'kaho99' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when username is missing' do
       post '/api/v1/authenticate', params: { username: 'kaho99'}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
