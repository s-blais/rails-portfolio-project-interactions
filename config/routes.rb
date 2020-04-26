Rails.application.routes.draw do
  
  root 'welcome#home' # create WelcomeController & welcome/home view

  get '/login' => 'sessions#new' # this will load login form, link to create new user, and eventually omniauth option

  post '/login' => 'sessions#create' # this will establish the user session, and eventually will include if statement to find_or_create omniauth

  # get '/homepage' => 'users#homepage' # this is the user's homepage, initially a list of patients. No, wait, I think this will be covered by user_show_path (show)

  get '/logout' => 'sessions#destroy' # this will be converted to a proper post route with a form

  get '/auth/google_oauth2/callback' => 'sessions#create'

  resources :users do
    resources :patients, only: [:index, :new, :edit, :update]
  end

  resources :patients, only: [:index, :show, :create, :update, :destroy] do
    resources :prescriptions, only: [:index, :new]
  end

  resources :medications, only: [:show, :new, :create]

  resources :prescriptions, only: [:create]

end
