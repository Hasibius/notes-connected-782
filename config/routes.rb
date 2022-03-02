Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard/:id", to: "pages#dashboard", as: :dashboard
  resources :attendences, only: [:show, :index]
  resources :events # needs classification after we've implemented all features
  resources :genres, only: %i[index show]
end
