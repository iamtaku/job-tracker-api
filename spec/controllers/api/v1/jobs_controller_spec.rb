require 'rails_helper'

describe "Jobs api", type: :request do
  describe "GET /jobs" do
    it 'returns all jobs' do
      FactoryBot.create(:job, company: 'plus company', application_link: 'http://www.google.com', position: 'coder')
      FactoryBot.create(:job, company: 'money foward', application_link: 'http://www.google.com', position: 'react-dev')
      get '/api/v1/jobs'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["data"].count).to eq(2)
    end
  end
  describe "POST /jobs" do
    it 'returns the created job' do
      expect {
        post '/api/v1/jobs', params: {job: {company: 'Google', position: 'frontend-dev', application_link: 'http://www.google.com'}}
      }.to change { Job.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /jobs'do
    it 'delete a job' do
      post = FactoryBot.create(:job, company: 'plus company', application_link: 'http://www.google.com', position: 'coder')
      delete "/api/v1/jobs/#{post.id}"

      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'PATCH /jobs/:id' do
    it 'updates a job' do
      post = FactoryBot.create(:job, company: 'plus company', application_link: 'http://www.google.com', position: 'coder')
      patch "/api/v1/jobs/#{post.id}", params: {
        job: {
          company: 'wework',
          application_link: 'https://www.wantedly.com/companies/wework3',
          position: 'react dev'
        }
      }

      expect(response.status).to eq(200)
      expect(response.body).to include('wework', 'react dev','https://www.wantedly.com/companies/wework3')
    end

  end
end
