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

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'login' => 'welcome#force_login'
  get '/finish_profile' => 'users#finish_profile'
  put '/finish_profile' => 'users#update'
  get '/walkthrough' => 'users#walkthrough'

  #Normal user-profile CRUD abilities (outside of devise to keep all in one place) of full profile
  get '/profile' => 'users#profile'
  get '/edit_profile' => 'users#edit_profile'
  put '/update_profile' => 'users#update'
  # Show a user all their matches
  get '/matches' => 'matches#index'
  get '/feed' => 'swipes#feed'
  #First-Time User Experience
  get '/pick-sports' => 'activity_blurbs#index'
  post '/pick-sports' => 'activity_blurbs#create'

  post 'swipes'=> 'swipes#create'

  get '/auth/:facebook/callback' => 'sessions#create'
  # For picking sports and writing bio
  get 'users/new' => 'users#create'

  # Look at another users' profile
  get 'users/:id' => 'users#show'




  get 'matches/:id/chat' => 'conversations#show'
  post 'matches/:id/chat' => 'conversations#create'

  resources :activity_blurbs

  # HACKY_SHIT
  # temp routes to test swiping
  get 'activities' => 'activity_blurbs#index'
  get '/swipe_yes/:user_id' => 'swipes#swipe_yes'
  get '/swipe_no/:user_id' => 'swipes#swipe_no'

  # temp route to test tutorial slider
  devise_scope :user do
    get "/step4" => 'registrations#show_tutorial'
  end
end
