Rails.application.routes.draw do
  resources :freelancers, only: [:index]
  resources :categories, only: [:show]
end
