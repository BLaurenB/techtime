Rails.application.routes.draw do
  resources :freelancers, only: [:index]
  resources :cart, only: [:create]

  get '/cart', to: 'cart#show'
end
