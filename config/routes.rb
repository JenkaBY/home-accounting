Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  get 'finances/index'
  get 'finances/destroy'
  get 'finances/update'
  get 'finances/new'
  get 'finances/create'
  get 'finances/show'

  resources :categories
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/destroy'
  # get 'categories/update'
  # get 'categories/new'
  # get 'categories/create'

  get '/home', to: 'application#home', as: 'home'
end
