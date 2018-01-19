Rails.application.routes.draw do
  resources :datafiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  resources :articles
  get 'signup', to:'users#new'
  #post 'users', to:'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # get 'graph/index', to: 'graph#index'
  # get 'graph/data', :defaults => { :format => 'json' }
  get 'datafiles/:id/data', to: 'datafiles#data', as: 'get_data', :defaults => { :format => 'json' }
end
