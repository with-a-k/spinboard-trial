Rails.application.routes.draw do
  resources :links, only: [:index, :create]
  resources :users, only: [:new, :create]
  get '/login', to: 'master#new'
  post '/login', to: 'master#create'
  get '/logout', to: 'master#destroy'
  root 'master#index'
end
