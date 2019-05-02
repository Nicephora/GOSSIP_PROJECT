Rails.application.routes.draw do
  get 'sessions/new'
  get 'comments/new'
  get 'comments/create'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  root 'gossips#index'
  get '/welcome/:first_name', to: 'welcome#message'
  get '/contact', to: 'contact#contact'
  get '/team', to: 'team#team'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  # get '/gossip/:id', to: 'gossip#gossip_display', as: 'gossip_display'
  # get '/user/:id', to: 'user#user_display', as: 'user_display'
  # get '/static_pages/contact', to: 'static_pages#contact'
  resources :users, only: [:show, :new, :create]
  resources :gossips, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments
  end
  # resources :comments, only: [:new, :create, :show, :edit, :update, :destroy]

end
