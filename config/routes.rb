Rails.application.routes.draw do
  resources :cart, only: [:create]
  resources :freelancers, only: [:index]

  get '/cart', to: 'cart#show'
  get '/:id', to: 'categories#show'
  delete '/cart', to: 'cart#destroy'

end
