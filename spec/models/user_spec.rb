require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  before { subject.valid? }

  it 'user should be invalid' do
    expect(subject).to_not be_valid
  end

  it 'show the error messages' do
    expect(subject.errors.full_messages).to eq(["Password can't be blank", "Email can't be blank", "Email is invalid"])
  end

  it 'email format should be valid' do
    subject.password = '123456'
    subject.email = 'email'
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to eq(["Email is invalid"])
  end

  it 'user should be valid' do
    subject.password = '123456'
    subject.email = 'example@email.com'
    expect(subject).to be_valid
    expect(subject.errors.full_messages).to eq([])
  end
end
