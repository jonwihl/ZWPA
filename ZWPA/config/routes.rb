ZWPA::Application.routes.draw do
  resources :audits

  resources :questionnaires

  resources :clients

  resources :users

end
