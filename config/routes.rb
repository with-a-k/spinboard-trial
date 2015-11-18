Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :update]
    end
  end
  resources :links, only: [:index, :create, :edit, :update]
  resources :users, only: [:new, :create]
  get '/login', to: 'master#new'
  post '/login', to: 'master#create'
  get '/logout', to: 'master#destroy'
  root 'master#index'
end
