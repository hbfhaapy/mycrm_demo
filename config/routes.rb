Rails.application.routes.draw do

  namespace :crm do
    namespace :deal do
      resources :pricelists
    end
  end

  resources :smartfinders

  namespace :fm do
    resources :incomes
  end

  namespace :fm do
    resources :billings
  end

  namespace :cm do
    resources :collections
  end

  namespace :cm do
    resources :contracts
  end

  namespace :crm do
    resources :activities
  end

  namespace :crm do
    resources :deals
  end

  namespace :crm do
    resources :contacts
  end

  namespace :crm do
    resources :addresses
  end

  namespace :crm do
    resources :phones
  end

  resources :properties

  namespace :crm do
    resources :companies
  end

  resources :organizations do
    collection do
      get :manage
      # required for Sortable GUI server side actions
      post :rebuild
    end
  end

  resources :roles

  devise_for :users
  root 'dashboard#index'

  namespace :dashboard do
    get "index", :as => :all
    get "crm", :as => :crm_overview
    get "fm", :as => :fm_overview
    get "oa", :as => :oa_overview
  end

  #修改密码  
  match "users/update_password/:id" => 'users#update_password', :as => :change_password, via: [:get, :patch]

  post "users/add" => "users#add"

  resources :users 

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
