require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  it "try creates a User and return User's validation errors" do
    post :create, params: { email: 'example@mail.com' }

    response_body = JSON.parse(response.body)

    expect(response_body['errors'][0]).to eq("Password can't be blank")
  end

  it "creates a User and return User's details" do
    post :create, params: { email: 'example@mail.com', password: '123456' }

    response_body = JSON.parse(response.body)

    expect(response_body['user']['email']).to eq('example@mail.com')
  end
end
