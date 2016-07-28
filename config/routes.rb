Rails.application.routes.draw do
  root 'static_pages#home'
  get'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

resources :users
get 'login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
