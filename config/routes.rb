Rails.application.routes.draw do
  root 'recipes#index'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get  '/recipes/top-rated', to: 'recipes#index' #Recipe.top_rated
  # get  '/recipes/:name', to: 'recipes#index' #Recipe.by_category
  
  

  #path_helper is free with resources - needs to be manually defined with as:
  # get  '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get  '/signup', to: 'users#new', as: 'new_user'
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]

  get    '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]
  resource :session

  resources  :recipes
  
end
