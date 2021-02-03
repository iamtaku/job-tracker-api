require 'rails_helper'

RSpec.describe Job, :type => :model do
  let(:user) { FactoryBot.create(:user, username: 'kaho99', password: 'password')}
  subject {
    Job.new(
      company: 'google',
      position: 'front-end',
      user: user
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
