ZWPA::Application.routes.draw do
	resources :waste_infos
	resources :areas
	resources :material_types
	resources :audits
	resources :questionnaires
	resources :clients
	resources :users

	# Application routes for archiving user/client
	get 'users/:id/archive', to: 'users#archive', as: :archive_user
	get 'clients/:id/archive', to: 'clients#archive', as: :archive_client

	# Application routes for reactivating user/client
  	get 'users/:id/reactivate', to: 'users#reactivate', as: :reactivate_user
  	get 'clients/:id/reactivate', to: 'clients#reactivate', as: :reactivate_client

  	# Application route for setting a particular area in an audit's end_date/status
  	get 'areas/:id/complete', to: 'areas#complete', as: :complete_area
    root :to => 'audits#index'
end
