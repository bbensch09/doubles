Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks"}
  # sessions: 'sessions',
  # , omniauth_callbacks: "users/omniauth_callbacks"

# FOR CANCELING FB SIGNUP
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/preview' => 'welcome#iframe'
  get '/iframe_source' => 'welcome#iframe_source'
  # You can have the root of your site routed with "root"
  get 'profile_test' => 'users#profile_test'

  get 'index2' => 'welcome#index2'
  root 'welcome#index'
  get 'login' => 'welcome#force_login'
  get '/finish_profile' => 'users#finish_profile'
  put '/finish_profile' => 'users#update'
  get '/walkthrough' => 'users#walkthrough'
  get '/complete_walkthrough' => 'users#complete_walkthrough'

  #Normal user-profile CRUD abilities (outside of devise to keep all in one place) of full profile
  get '/profile' => 'users#profile'
  get '/profile/edit' => 'users#edit_profile'
  get '/profile/add-zipcode' => 'users#add_zipcode'
   put '/update_profile' => 'users#update'
  put '/users/:id' => 'users#update'

  # Show a user all their matches
  get '/matches' => 'matches#index'
  get '/feed' => 'swipes#feed'
  #First-Time User Experience
  get '/pick-sports' => 'activity_blurbs#new'
  post '/pick-sports' => 'activity_blurbs#create'

  post 'swipes'=> 'swipes#create'

  get '/auth/:facebook/callback' => 'sessions#create'
  # For picking sports and writing bio
  get 'users/new' => 'users#create'

  # Look at another users' profile
  get 'users/:id' => 'users#show'

  delete '/remove_sport' => 'activity_blurbs#destroy'



  get 'matches/:id/chat' => 'conversations#show'
  post 'matches/:id/chat' => 'conversations#create'

  resources :activity_blurbs

  # HACKY_SHIT
  # temp routes to test swiping
  get 'activities' => 'activity_blurbs#index'

  # temp route to test tutorial slider
  devise_scope :user do
    get "/step4" => 'registrations#show_tutorial'
  end
end
