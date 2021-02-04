require 'rails_helper'

describe 'Steps Api Endpoint',type: :request do
  let(:user) { FactoryBot.create(:user, username: 'kaho99', password: 'password') }
  let(:token) { AuthenticationTokenService.call(user.id) }
  let(:headers) { {"Authorization" => "Bearer #{token}"} }
  let(:job) { FactoryBot.create(:job, company: 'plus company', application_link: 'http://www.google.com', position: 'coder', user: user) }
  let(:step) { FactoryBot.create(:step, job: job) }
  # let(:token) { AuthenticationTokenService.call(user.id) }
  # let(:headers) {{"Authorization" => "Bearer #{token}"}

  describe 'GET /step/:id' do
    it 'should return a valid step' do

      get "/api/v1/steps/#{step.id}/", headers: headers
      expect(response.status).to eq(200)
    end
  end
  describe 'POST /steps' do
    it 'should create and return a valid step' do
      date = Time.now

      post "/api/v1/jobs/#{job.id}/steps", params: {
        step: {
          date: date,
          job: job
        }
      }, headers: headers
      expect(response).to have_http_status(:created)
    end
  end
  describe 'PATCH /steps/:id' do
    it 'should update and return a step' do

      patch "/api/v1/steps/#{step.id}", params: {
        step: {
          date: Time.now,
          status: 'completed'
        }
      }, headers: headers
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["data"]["attributes"]).to include("status" => "completed")
    end
  end
  describe 'DELETE /steps/:id' do
    it 'should delete a step' do
      job = Job.create!(company: 'google', position: 'front-end', user: user)
      date = Date.today
      step = Step.new(date: date)
      step.job = job
      step.save

      expect {
        delete "/api/v1/steps/#{step.id}", headers: headers
      }.to change { Step.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
