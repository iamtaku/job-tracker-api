require 'rails_helper'

RSpec.describe "Api::V1::Jobs", type: :request do
  describe "Jobs api" do
    before do
      @job = Job.create!(company: 'plus', position: 'coder')
      @step = Step.new(date: Date.today)
      @step.job = @job
      @step.save
    end
    it 'should return valid JSON for a job ' do
      get '/api/v1/jobs'
      json = JSON.parse(response.body)
      p json[0]
      expect(response.status).to eq(200)

    end
  end
end
