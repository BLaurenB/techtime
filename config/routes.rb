Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/logout', to: 'sessions#destroy'

  # root to: "welcome#index"
  post '/cart', to: 'cart#create', as: 'cart_index'
   #resources :cart, only: [:create]

  #resources :freelancers, only: [:show]
  get '/freelancers', to: 'freelancers#index'
  get '/freelancers/:id', to: 'freelancers#show', as: 'freelancer'
  get '/categories', to: 'categories#index'
  get '/:id', to: 'categories#show', as: 'category'

  #resources :categories, only: [ :show]
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/orders', to: 'orders#index'
  get '/orders', to: 'orders#show', as: 'order'
  post '/orders', to: 'order#create'
  #resources :users, only: [:new, :create, :show]
  #resources :orders, only: [:index, :show, :create]

  namespace :admin do
    resources :users, only: [:edit, :update, :show]
    resources :freelancers, only: [:new, :create, :index, :edit, :update]

    resources :orders, only: [:show]
    get '/dashboard', to: 'orders#index'
    patch '/dashboard', to: 'orders#update'
  end



  get '/cart', to: 'cart#show'
  patch '/cart', to: 'cart#update'
  #get '/:id', to: 'categories#show'
  delete '/cart', to: 'cart#destroy'



end
