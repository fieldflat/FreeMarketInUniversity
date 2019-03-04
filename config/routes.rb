Rails.application.routes.draw do
  # home
  root 'static_pages#home'

  # signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # users
  resources :users

  # microposts
  resources :microposts,          only: [:new, :create, :destroy]
end
