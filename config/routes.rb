Rails.application.routes.draw do
  root 'recipes#index'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  

  #path_helper is free with resources - needs to be manually defined with as:
  # get  '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get  '/signup', to: 'users#new', as: 'new_user'

  get    '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]
  resource :session

  resources :users, only: [:index, :create, :edit, :update, :destroy] do
    resources  :recipes, shallow: true
  end

  post  '/recipes/:id/rate', to: 'recipes#save_rating'
  
  resources  :recipes
  

  
  
end
