Octopus::Application.routes.draw do
  # get "sessions/new"
  # get "users/new"

  root :to => 'users#new', :as => '/'

  # resources :users do
  #   get '/profile', to: 'users#show', as: 'profile_path'
  #   get '/', to: 'users#create', as: 'signup_path'
  # end
  resources :users
  get '/profile', to: 'users#show', as: 'profile_path'

  post 'cards', to: 'cards#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
