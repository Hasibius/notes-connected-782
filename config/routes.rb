Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard/:id", to: "pages#dashboard", as: :dashboard
  resources :attendences, only: %i[show index]
  post 'events/:event_id/attendances', to: 'attendances#create', as: :create_attendance
  delete 'events/:event_id/attendances', to: 'attendances#destroy', as: :delete_attendance
  post 'dashboard/:user_id/attendances', to: 'follows#create', as: :create_follow
  delete 'dashboard/:user_id/attendances', to: 'follows#destroy', as: :delete_follow
  resources :events do
    resources :comments, only: %i[create edit update]
  end
  resources :comments, only: %i[destroy]
  resources :genres, only: %i[index show]
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
