require 'rails_helper'

RSpec.describe Step, :type => :step do
  subject {
    Step.new(
      date: Date.today
    )
  }

  it "should not be valid without a job" do
    expect(subject).to_not be_valid
  end
  it "should be valid with valid attributes" do
    subject.job = Job.new(company: 'google', position: 'backend')
    expect(subject).to be_valid
  end
end
