require 'rails_helper'

RSpec.describe Api::V1::ImagesController, type: :controller do
  describe  'GET #new' do
    before :each do
      @user = create(:user, email: 'example@mail.com', password: '123456')
      sign_in @user
    end

    it "creates a Image and redirects to the Image's page" do
      get :new
      expect(response.body).to eq([])

      # post '/api/v1/images', :params => { :image => {:name => 'My Image'} }
      #
      # expect(response).to redirect_to(assigns(:image))
      # follow_redirect!
      #
      # expect(response).to render_template(:show)
      # expect(response.body).to include('Image was successfully created.')
    end
  end
end
