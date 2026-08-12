Rails.application.routes.draw do
  root "movies#index"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  resources :movies do
    resources :favourites, only: [:create, :destroy]
    resources :reviews
  end
  resource :session, only: [:new, :create, :destroy]

  resources :users

  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
