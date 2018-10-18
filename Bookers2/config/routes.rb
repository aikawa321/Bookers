Rails.application.routes.draw do

  get 'homes/index'
  get 'homes/about'
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, :only => [:index, :show,:edit,:update]
  resources :users
  resources :books
  resources :home, only:[:index, :about]
  root to: 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
