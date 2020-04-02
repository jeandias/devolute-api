Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :users, only: [:create]
      post '/sign_in', to: 'auth#sign_in'

      resource :images, only: [:create, :show]
      get '/images/generate_aws_url', to: 'images#generate_aws_url'
    end
  end
end
