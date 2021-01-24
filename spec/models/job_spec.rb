require 'rails_helper'

RSpec.describe Job, :type => :model do
  subject {
    Job.new(
      company:'google',
      position: 'front-end'
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a company" do
    subject.company = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a position" do
    subject.position = nil
    expect(subject).to_not be_valid
  end
end
