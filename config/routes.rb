Rails.application.routes.draw do
  resources :freelancers, only: [:index]
  resources :cart, only: [:create]

end
