Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  namespace :admin do
    get 'dashboard' => 'dashboard#show'
    get 'products/manage' => 'products#manage'
    get 'product/:id/edit' => 'products#edit', as: :product_edit
    delete 'product/:id/image/:image_id' => 'products#delete_image', as: :product_image_delete
    get 'product/new' => 'products#new', as: :new_product
    post 'product/' => 'products#create', as: :product_create
    put 'product/:id' => 'products#update', as: :product_update
    post 'product/image/upload' => 'products#upload', as: :product_image_upload
    get 'orders/manage' => 'orders#manage', as: :orders_manage
  end

  resources :products
  get 'products/page/:page_number' => "products#index", as: :products_page

  get 'cart' => 'cart#show'
  put 'cart/add' => 'cart#add'
  get 'cart/items' => 'cart#index'
  put 'cart/items' => 'cart#update'
  delete 'cart/item/:id' => 'cart#destroy'

  post 'feedback' => 'feedback#create', as: :create_feedback

  get 'information/contactus' => 'information#contact'
  get 'information/about' => 'information#about'
  get 'information/conditions' => 'information#tnc'
  get 'information/privacy' => 'information#privacy'

  get 'checkout/address' => "checkout#address"
  post 'checkout/address' => "checkout#create_address"
  get 'checkout/payment' => "checkout#payment"
  put 'checkout/payment' => "checkout#update_payment"
  get 'checkout/order/:id' => "checkout#show_order", as: :checkout_order
  # get 'checkout/confirm/:cart_id' => "checkout#confirm", as: :confirm_cart

  resources :category do
    get ':name' => "categories#index", as: :listing
    resources :products
    get 'products/page/:page_number' => "categories#index", as: :category_product_page
  end

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
