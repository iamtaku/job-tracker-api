require 'rails_helper'

describe 'Steps Api Endpoint',type: :request do
  describe 'GET /step/:id' do
    it 'should return a valid step' do
      job = Job.create!(company: 'google', position: 'front-end')
      step = Step.new
      step.job = job
      step.save

      get "/api/v1/steps/#{step.id}/"
      expect(response.status).to eq(200)
    end
  end
  describe 'POST /steps' do
    it 'should create and return a valid step' do
      job = Job.create!(company: 'google', position: 'front-end')
      date = Date.today
      step = Step.new(date: date)
      step.job = job
      step.save

      post "/api/v1/steps"
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include(date)
    end
  end
  describe 'PATCH /steps/:id' do
    it 'should update and return a step' do
      job = Job.create!(company: 'google', position: 'front-end')
      step = Step.new
      step.job = job
      step.save

      get "/api/v1/steps/#{step.id}/"

    end
  end
end
