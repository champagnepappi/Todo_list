Rails.application.routes.draw do
  root 'static_pages#home'
  get'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :users
  resources :lists, except:[:index, :new] do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
