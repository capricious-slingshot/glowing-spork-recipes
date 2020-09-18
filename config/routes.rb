Rails.application.routes.draw do
  root 'recipes#index'

  #url path helper is free with rails - needs to be manually defined with routes
  # get  '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get  '/signup', to: 'users#new', as: 'new_user'
  resources :users, only: [:index, :show, :create, :edit, :destroy]
 


  get  '/recipes', to: 'recipes#index'
  get  '/recipes/:id', to: 'recipes#show'

end
