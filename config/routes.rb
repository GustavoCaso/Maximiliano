Maximiliano::Application.routes.draw do


  resources :orders

  resources :line_items



  get "cart", to: "carts#show"
  delete "carts", to: "carts#destroy"

  devise_for :users
  resources :products, only:[:show]

  get "static/home"
  root 'static#home'
  get "help", to: "static#help", as: "help"
  get "us", to: "static#us", as: "us"
  get "tailor", to: "static#tailor", as: "tailor"
  get "admin", to: "admin#index", as: "admin"

  get "collection", to: "products#collection", as: "collection"
  get "urban", to: "products#urban", as: "urban"
  get "accesories", to: "products#accesories", as: "accesories"

  get '/admin', to: "admin#index", as: :user_root

  namespace :admin do
    resources :products
    resources :users
  end

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
end
