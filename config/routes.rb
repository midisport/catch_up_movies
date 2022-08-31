Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :artists, only: :show
  resources :bookings, only: %I[index create]
  resources :cinemas, only: :show

  resources :movies, only: %I[index show] do
    resources :comments, only: :create
    resources :interests, only: :create
  end

  resources :interests, only: %I[index destroy]
  resources :follows, only: %I[index create destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
