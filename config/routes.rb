Rails.application.routes.draw do
  resources :freelancers, only: [:index]
  resources :categories, only: [:show]

  get '/:id', to: 'categories#show'
end
