ZWPA::Application.routes.draw do
  resources :audits

  resources :questionnaires

  resources :clients

  resources :users

  # Application routes for archiving user/client
  get 'users/:id/archive', to: 'users#archive', as: :archive_user
  get 'clients/:id/archive', to: 'clients#archive', as: :archive_client

end
