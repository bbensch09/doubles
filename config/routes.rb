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


  get 'users/:id/feed' => 'swipes#feed'

  get 'matches/:id/chat' => 'conversations#show'
  post 'matches/:id/chat' => 'conversations#create'

  get 'cards' => 'swipes#cards'

  resources :activity_blurbs

  get '/users/:current_user_id/feed' => 'swipes#feed'

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
