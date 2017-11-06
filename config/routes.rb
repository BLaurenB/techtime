Rails.application.routes.draw do
  root to: "welcome#index"

  resources :cart, only: [:create]
  resources :freelancers, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:index, :show, :create]

  namespace :admin do
    resources :users, only: [:edit, :update, :show]
    resources :freelancers, only: [:new, :create]
    get '/dashboard', to: 'orders#index'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart#show'
  patch '/cart', to: 'cart#update'
  get '/:id', to: 'categories#show'
  delete '/cart', to: 'cart#destroy'



end
