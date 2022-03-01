Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :events
  get "dashboard", to: "pages#dashboard"
  resources :attendences, only: [:show, :index]
=======
  resources :events # needs classification after we've implemented all features
>>>>>>> master
end
