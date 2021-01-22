require 'rails_helper'

describe "Jobs api", type: :request do
  describe "GET /jobs" do
    it 'returns all jobs' do
      FactoryBot.create(:job, company: 'plus company', application_link: 'http://www.google.com', position: 'coder')
      FactoryBot.create(:job, company: 'money foward', application_link: 'http://www.google.com', position: 'react-dev')

      get '/api/v1/jobs'


      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).count).to eq(2)
    end
  end
  describe "POST /jobs" do
    it 'returns the created job' do
      expect {
        post '/api/v1/jobs', params: {job: {company: 'Google', position: 'frontend-dev', application_link: 'http://www.google.com'}}
      }.to change { Job.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      # p JSON.parse(response.body)
    end
  end

  describe 'DELETE /jobs'do
    it 'delete a job' do
       post '/api/v1/jobs', params: {job: {company: 'Google', position: 'frontend-dev', application_link: 'http://www.google.com'}}
      #  test = JSON.parse(response.body)
       id_to_check =  JSON.parse(response.body)['id']
      #  p test
      delete "/api/v1/jobs/#{id_to_check}"

      expect(response).to have_http_status(:no_content)
    end

  end
  # it 'creates a job' do


  # end
end
