Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, except: [:destroy] do
    resources :bookings, only: [:create]
  end
  resources :users, only: [:show]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos, only: [:destroy]
  get "about" => "pages#about"

end
