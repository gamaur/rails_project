Rails.application.routes.draw do

  namespace :api do
    resources :posts, only: [:index, :show]
  end

  root 'posts#index'

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :posts, only: [:index, :create, :show]
  end

  post 'sessions/new' => 'sessions#create', as: :create_session

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [:index, :show, :edit, :update, :destroy]

  get 'comments/' => 'comments#index', as: :comments

  post 'comments/' => 'comments#create'

  delete 'comments/:id' => 'comments#destroy', as: :comment_post


end

  # get 'sessions/new'

  # get 'users/index', as: :users

  # get 'welcome/index'
  # get 'users/new' => 'users#new', as: :new_user

  # get 'users/:id' => 'users#show', as: :show
  # post 'users/:id' => 'users#create', as: :create

  # get 'users/:id/edit' => 'users#edit', as: :edit_user
  # patch 'users/:id' => 'users#update', as: :user

  # get 'sessions/new' => 'sessions#new', as: :new_session

  # get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
# end
