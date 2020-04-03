require 'rails_helper'

RSpec.describe Api::V1::ImagesController, type: :controller do
  before :each do
    @user = create(:user, email: 'example@mail.com', password: '123456')
    sign_in @user
  end

  let(:image_url) { 'http://image.aws.com' }

  it "creates a Image and return Image's details" do
    post :create, params: { image_url: image_url }

    response_body = JSON.parse(response.body)

    expect(response_body['image']['user_id']).to eq(@user.id)
    expect(response_body['image']['image_url']).to eq(image_url)
  end

  it "return Image's empty list" do
    get :show
    response_body = JSON.parse(response.body)
    expect(response_body).to eq({ 'items' => [] })
  end

  it "return Image's list" do
    image = create(:image, user: @user, image_url: image_url)

    get :show
    response_body = JSON.parse(response.body)
    expect(response_body).to eq({ 'items' => [{ 'id' => image.id, 'image_url' => 'http://image.aws.com' }]})
  end

  it 'return s3 amazon aws url' do
    get :generate_aws_url
    response_body = JSON.parse(response.body)
    expect(response_body['url']).to eq('https://devolute-ui.s3.eu-west-1.amazonaws.com')
  end
end
