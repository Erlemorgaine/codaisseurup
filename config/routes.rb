Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, except: [:destroy]
  resources :users, only: [:show]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
  get "about" => "pages#about"

end
