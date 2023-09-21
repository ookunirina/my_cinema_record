Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Defines the root path route ("/")
  root 'top#index'
  get 'terms', to: 'top#terms'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'movie_information', to: 'movie_information#index'
  get 'movies/search', to: 'movies#search'
  get 'movies/show', to: 'movies#show'
  get 'recommended', to: 'recommended#index'

  resources :users, only: %i[new create]
  resources :movierecords do
    collection do
      get :likes
    end
    resources :likes, only: %i[create destroy]
  end

  resources :schedules

  resources :tags do
    get 'movierecords', to: 'movierecords#search'
  end

  resources :rankings, only: :index
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end
