Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Defines the root path route ("/")
  root 'top#index'
  get 'terms', to: 'top#terms'
  get 'privacy', to: 'top#privacy'
  get 'contact', to: 'top#contact'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'movie_information', to: 'movie_information#index'
  get 'movies/search', to: 'movies#search'
  get 'movies/show', to: 'movies#show'
  get 'recommended', to: 'recommended#index'

  resources :movierecords do
    collection do
      get :likes
    end
    resources :likes, only: %i[create destroy]
  end

  resources :tags do
    get 'movierecords', to: 'movierecords#search'
  end

  resources :users, only: %i[new create]
  resources :schedules
  resources :rankings, only: :index
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  namespace :admin do
    root to: 'dashmovierecords#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index show edit update destroy]
    resources :movierecords, only: %i[index show edit update destroy]
  end
end
