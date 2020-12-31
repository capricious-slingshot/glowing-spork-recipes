Rails.application.routes.draw do
  root 'recipes#index'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  #path_helper is free with resources - needs to be manually defined with as:
  # get  '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get  '/signup', to: 'users#new', as: 'new_user'

  get    '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]
  resource :session

  post  '/recipes/:id/rate', to: 'recipes#save_rating'
  post  'users/:id/recipes/:id/save', to: 'user_recipe_cards#save_recipe', as: 'save_recipe'
  
  resources :recipes 
  get '/recipes/category/:category_name', to: "recipes#index", as: 'recipe_category'

  resources :users, only: [:index, :create, :edit, :update, :destroy] do
    resources  :recipes do
      resources :user_recipe_cards, only: [:new, :create, :edit, :update, :destroy], as: 'cards'
    end
  end
  
end
