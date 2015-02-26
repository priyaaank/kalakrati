Rails.application.routes.draw do
  root 'home#index'

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
    get 'order/:id' => 'orders#show', as: :order_show
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

  resources :category do
    get ':name' => "categories#index", as: :listing
    resources :products
    get 'products/page/:page_number' => "categories#index", as: :category_product_page
  end
end
