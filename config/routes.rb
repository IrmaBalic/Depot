Rails.application.routes.draw do

  #get 'addresses/index'

  #get 'addresses/show'

  #get 'addresses/new'

  #get 'categories/index'

  #get 'categories/show'

  #get 'categories/edit'

  #get 'categories/new'

  #get 'categories' => 'categories#index'

  #post 'categories/create'
  scope "(:locale)", locale: /bs|en/ do
    get 'orders' => 'orders#index'
    get 'product_images' => 'product_images#index'
    get 'about' => 'static_pages#aboutus'
    get 'faq' => 'static_pages#faq'
    get 'contact' => 'static_pages#contact'

    delete '/product_images/:id', to: 'product_images#destroy', as: 'product_image'
    resources :categories
    resources :users do  
      collection do
        get :purchuase
      end
    end
    resources :roles
    resources :brands
    resources :addresses do
      collection do
        get :old_addresses
        get :new_shipping
        get :new_billing
        post :create_shipping
        post :create_billing
      end
    post 'change', on: :member
    end
    resources :charges do
      post 'change', on: :collection
    end
    get 'administrator' => 'orders#index'
    controller :admin_sessions do
      get  'signin' => :new
      post 'signin' => :create
      delete 'signout' => :destroy
    end
     controller :static_pages do
      get  'aboutus' => :aboutus
      get  'faq' => :faq
      get  'contact' => :contact
    end
    resources :line_items do
      post 'increment', on: :member
      post 'decrement', on: :member
    end
    resources :carts
    get 'store/index'
    resources :products do
      get :who_bought, on: :member
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'store#index', as: 'store'
  get '/:locale' => 'store#index'
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
