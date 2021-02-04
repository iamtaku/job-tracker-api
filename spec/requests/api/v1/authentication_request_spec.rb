require 'rails_helper'

RSpec.describe "Api::V1::Authentications", type: :request do
 describe 'POST /authentication' do
  let(:user) { FactoryBot.create(:user, username: 'kaho99', password: 'password') }

  it 'authenticates the client' do
    post '/api/v1/authenticate', params: { username: user.username, password: 'password' }
    expect(response).to have_http_status(:created)
    expect(JSON.parse(response.body)).to eq(
    {
     'token' => AuthenticationTokenService.call(user.id)
    }
  )

  end
  it 'returns error when password is missing' do
    post '/api/v1/authenticate', params: { username: user.username }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns error when username is missing' do
    post '/api/v1/authenticate', params: { password: 'password' }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns error when password is incorrect' do
    post '/api/v1/authenticate', params: { username: user.username, password: 'wrong' }
    expect(response).to have_http_status(:unauthorized)
  end
 end
end
