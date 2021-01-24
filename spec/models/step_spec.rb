require 'rails_helper'

RSpec.describe Step, :type => :step do
  subject do
    Step.new(
      date: Date.today
    )
  end

  it "should not be valid without a job" do
    expect(subject).to_not be_valid
  end
  it "should be valid with a job" do
    subject.job = Job.new(company: 'google', position: 'backend')
    expect(subject).to be_valid
  end
end
