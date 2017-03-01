Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'application#home'

  resources :categories
  resources :finances
  get '/finances/filter', :as => :filter

  get '/home', to: 'application#home', as: 'home'
  get '/report/new' => 'report#new', :as => :new_report
  post '/report' => 'report#generate', :as => :report
  get '/report' => 'report#report_get'

end