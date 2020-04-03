require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { build(:image) }

  before { subject.valid? }

  it 'image should be invalid' do
    expect(subject).to_not be_valid
  end

  it 'show the error messages' do
    expect(subject.errors.full_messages).to eq(["Image url can't be blank", "User must exist"])
  end

  it 'image should be valid' do
    user = create(:user, email: 'example@mail.com', password: '123456')
    subject.image_url = 'http://image.aws.com'
    subject.user = user

    expect(subject).to be_valid
  end
end
