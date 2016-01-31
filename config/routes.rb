Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions', omniauth_callbacks: "users/omniauth_callbacks"}
  # sessions: 'sessions',
  # , omniauth_callbacks: "users/omniauth_callbacks"

# FOR CANCELING FB SIGNUP
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  post 'swipes'=> 'swipes#create'

  get '/auth/:facebook/callback' => 'sessions#create'
  # For picking sports and writing bio
  get 'users/new' => 'users#create'

  # Look at another users' profile
  get 'users/:id' => 'users#show'

  # Show a user all their matches
  get 'users/:id/matches' => 'matches#index'


  get 'users/:id/feed' => 'swipes#show'

  get 'matches/:id/chat' => 'conversations#show'
  post 'matches/:id/chat' => 'conversations#create'

  get 'cards' => 'swipes#cards'

  devise_scope :user do
    get "/step4" => 'registrations#show_tutorial'
  end
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
