Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy' # this will be converted to a proper post route with a form

  get '/auth/google_oauth2/callback' => 'sessions#create'

  resources :users do #maybe add path: 'providers'
    resources :patients, only: [:index, :new, :edit, :update]
  end

  resources :patients, only: [:index, :show, :create, :update, :destroy] do
    resources :prescriptions, only: [:index, :new, :edit]
  end

  resources :medications, only: [:index, :show, :new, :create]

  resources :prescriptions, only: [:index, :create, :update, :destroy]

end
