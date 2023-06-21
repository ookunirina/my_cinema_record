Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Defines the root path route ("/")
  root 'top#index'
  get 'movie_information/index'
  get 'movie_information', to: 'movie_information#index'

  resources :users, only: %i[new create]
  resources :movierecords, only: %i[index new create show]
end
