Rails.application.routes.draw do
  resources :links, only: [:index]
  resources :users, only: [:new, :create]
  get '/login', to: 'master#new'
  post '/login', to: 'master#create'
  root 'master#index'
end
