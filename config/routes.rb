Rails.application.routes.draw do
  resources :freelancers, only: [:index]

end
