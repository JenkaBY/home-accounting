Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  resources :categories
  resources :finances

  get '/home', to: 'application#home', as: 'home'
  # get 'report', to: 'report#generate', as: 'report'
  # post 'report', to: 'report#rep', as: 'report'
  get '/report/new' => 'report#new', :as => :new_report
  post '/report' => 'report#generate', :as => :report
  get '/report' => 'report#report_get'

end
