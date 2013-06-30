Slinky::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'home#index'

  match '/login' => "sessions#new"
  match '/logout' => "sessions#destroy"
  match '/signup' => "users#new"

end
