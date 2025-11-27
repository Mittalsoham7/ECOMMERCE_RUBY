Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Devise routes for user authentication (Feature 3.1.4 ✯)
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Root path - Products index page (Feature 2.1 ✯)
  root "products#index"
  
  # Products routes
  resources :products, only: [:index, :show]
  
  # Categories routes
  resources :categories, only: [:show]
  
  # Shopping Cart routes (Feature 3.1.1 & 3.1.2 ✯)
  get 'cart', to: 'cart#index', as: 'cart'
  post 'cart/add/:id', to: 'cart#add_item', as: 'add_to_cart'
  patch 'cart/update/:id', to: 'cart#update_item', as: 'update_cart_item'
  delete 'cart/remove/:id', to: 'cart#remove_item', as: 'remove_from_cart'
  delete 'cart/clear', to: 'cart#clear', as: 'clear_cart'
  
  # Orders routes (Feature 3.1.3 ✯ - Checkout)
  resources :orders, only: [:index, :show, :new, :create] do
    collection do
      post :calculate_tax
    end
  end
  
  # User profile and addresses (Feature 3.1.5)
  resource :profile, only: [:show, :edit, :update]
  resources :addresses, except: [:show]
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
