require 'rails_helper'

describe 'Steps Api Endpoint',type: :request do
  subject {
    job = Job.create!(company: 'google', position: 'front-end')
    Step.create(job: job)
  }

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
      date = Time.now

      post "/api/v1/jobs/#{job.id}/steps", params: {
        step: {
          date: date,
          job: job
        }
      }
      expect(response).to have_http_status(:created)
    end
  end
  describe 'PATCH /steps/:id' do
    it 'should update and return a step' do
      job = Job.create!(company: 'google', position: 'front-end')
      step = Step.new
      step.job = job
      step.save

      patch "/api/v1/steps/#{step.id}", params: {
        step: {
          date: Time.now,
          status: 'completed'
        }
      }
      expect(response.status).to eq(200)
      # expect(JSON.parse(response.body)).to include('status' => 'completed')
    end
  end
  describe 'DELETE /steps/:id' do
    it 'should delete a step' do
      job = Job.create!(company: 'google', position: 'front-end')
      date = Date.today
      step = Step.new(date: date)
      step.job = job
      step.save

      expect {
        delete "/api/v1/steps/#{step.id}"
      }.to change { Step.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
