Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Defines the root path route ("/")
  root 'top#index'
  get 'movie_information/index'
  get 'movie_information', to: 'movie_information#index'
  
  get 'movies/search', to: 'movies#search'
  get 'movies/show', to: 'movies#show'
  
  resources :users, only: %i[new create]
  resources :movierecords do
    collection do
      get :likes
    end
    resources :likes, only: %i[create destroy]
  end

  resources :tags do
    get 'movierecords', to: 'movierecords#search'
  end

  resources :rankings, only: :index
  resource :profile, only: %i[show edit update]
end
