Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/logout', to: 'sessions#destroy'

  # root to: "welcome#index"
  post '/cart', to: 'cart#create', as: 'cart_index'
  get '/cart', to: 'cart#show', as: 'cart'
  patch '/cart', to: 'cart#update'
  #get '/:id', to: 'categories#show'
  delete '/cart', to: 'cart#destroy'
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

  get '/admin/users/:id', to: 'admin/users#show', as: 'admin_user'
  put '/admin/users/:id', to: 'admin/users#update'
  patch '/admin/users/:id', to: 'admin/users#update'
  get '/admin/users/:id/edit', to: 'admin/users#edit', as: 'edit_admin_user'

  get '/admin/freelancers', to: 'admin/freelancers#index', as: 'admin_freelancers'
  post '/admin/freelancers', to: 'admin/freelancers#create'
  get '/admin/freelancers/new', to:'admin/freelancers#new', as: 'new_admin_freelancer'
  get '/admin/freelancers/:id/edit', to: 'admin/freelancers#edit', as: 'edit_admin_freelancer'
  patch '/admin/freelancers/:id', to: 'admin/freelancers#update'
  put '/admin/freelancers/:id', to: 'admin/freelancers#update'
  get '/admin/orders/:id', to: 'admin/orders#show', as: 'admin_order'
  get 'admin/dashboard', to: 'admin/orders#index', as: 'admin_dashboard'
  patch 'admin/dashboard', to: 'admin/orders#update'

  # namespace :admin do
  #   resources :users, only: [:edit, :update, :show]
  #   resources :freelancers, only: [:new, :create, :index, :edit, :update]

    #resources :orders, only: [:show]

end
