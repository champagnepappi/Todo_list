Rails.application.routes.draw do
  root 'static_pages#home'
  get'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :users
  resources :lists do
    resources :todo_items
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
