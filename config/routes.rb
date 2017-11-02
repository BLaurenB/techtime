Rails.application.routes.draw do
  root to: 'categories#index'

  resources :cart, only: [:create]
  resources :freelancers, only: [:index, :show]
  resources :categories, only: [:index, :show]

  get '/cart', to: 'cart#show'
  patch '/cart', to: 'cart#update'
  get '/:id', to: 'categories#show'
  delete '/cart', to: 'cart#destroy'

end
