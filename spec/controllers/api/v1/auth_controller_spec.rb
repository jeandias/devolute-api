require 'rails_helper'

RSpec.describe Api::V1::AuthController, type: :controller do
  it 'when the user was not found' do
    post :sign_in, params: { email: 'example@mail.com', password: '123456' }

    response_body = JSON.parse(response.body)

    expect(response_body['failure']).to eq('Sign in failed! Email or password invalid!')
  end

  it '' do
    user = create(:user, email: 'example@mail.com', password: '123456')
    post :sign_in, params: { email: user.email, password: '123456' }

    response_body = JSON.parse(response.body)

    expect(response_body['success']).to eq('Welcome back, example@mail.com')
    expect(response_body['user']['email']).to eq(user.email)
  end
end
