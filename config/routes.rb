Rails.application.routes.draw do

  resources :roles, :properties, :smartfinders

  namespace :crm do
    resources :addresses, :phones, :deals

    resources :contacts do
      match 'advanced_search' => 'contacts#advanced_search',
            on: :collection, via: [:get, :post], as: :contacts_advanced_search
    end

    namespace :contact do
      resources :statuses
    end

    resources :companies do
      match 'advanced_search' => 'companies#advanced_search',
            on: :collection, via: [:get, :post], as: :companies_advanced_search
    end

    resources :activities do
      match 'advanced_search' => 'activities#advanced_search',
            on: :collection, via: [:get, :post], as: :activities_advanced_search
    end

    namespace :company do
      resources :categories
    end

    namespace :contact do
      resources :categories
    end

    namespace :phone do
      resources :klasses
    end

    namespace :activity do
      resources :statuses
      resources :categories
    end

    namespace :deal do
      resources :statuses
      resources :categories
      resources :pricelists
    end
  end

  namespace :fm do
    resources :incomes do
      match 'advanced_search' => 'incomes#advanced_search',
            on: :collection, via: [:get, :post], as: :incomes_advanced_search
    end
    resources :billings do
      match 'advanced_search' => 'billings#advanced_search',
            on: :collection, via: [:get, :post], as: :billings_advanced_search
    end
  end

  namespace :cm do
    resources :collections do
      match 'advanced_search' => 'collections#advanced_search',
            on: :collection, via: [:get, :post], as: :collections_advanced_search
    end
    resources :contracts do
      match 'advanced_search' => 'contracts#advanced_search',
            on: :collection, via: [:get, :post], as: :contracts_advanced_search
    end

    namespace :contract do
      resources :statuses
    end
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
