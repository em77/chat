Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'chat_rooms/show'

  root to: 'chat_rooms#index'

  resources :users, only: [:new, :create]
  resources :chat_rooms, only: [:new, :create, :show]
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
