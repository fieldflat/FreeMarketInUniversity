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
  resources :microposts,          only: [:new, :show, :create, :edit, :destroy, :update]

  # favorites
  resources :favorites,           only: [:index, :create, :destroy]
  post '/favorites/:id', to: 'favorites#destroy'

  # rooms
  resources :rooms,               only: [:index, :show, :create, :destroy]

  # messages
  resources :messages,            only: [:create]

  #
  resources :evaluations,         only: [:index, :new, :create]
end
