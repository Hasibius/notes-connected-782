Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard/:id", to: "pages#dashboard", as: :dashboard
  resources :attendences, only: %i[show index]
  post 'events/:event_id/attendances', to: 'attendances#create', as: :create_attendance
  delete 'events/:event_id/attendances', to: 'attendances#destroy', as: :delete_attendance
  resources :events do
    resources :comments, only: %i[create edit update]
  end
  resources :comments, only: %i[destroy]
  resources :genres, only: %i[index show]
end
