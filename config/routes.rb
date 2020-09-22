Rails.application.routes.draw do
  root 'recipes#index'

  get    '/login', to: 'session#new'
  resource :session

  #path_helper is free with resources - needs to be manually defined with as:
  # get  '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get  '/signup', to: 'users#new', as: 'new_user'
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
 
  # delete '/logout', to: 'session#delete', as: 'delete_session'

  resources  :recipes
  
end
