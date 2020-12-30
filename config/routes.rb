Rails.application.routes.draw do
  get 'characters/new'
  get 'sessions/new'
  get 'users/new'
  get 'groups/new'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/home', to: 'static_pages#home' # Not sure if this is necessary along with the root line below!
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/createparty', to: 'groups#new'
  post '/createparty', to: 'groups#create'
  post '/makechar', to: 'characters#create'
  get '/makechar', to: 'characters#new'
  get '/characters', to: 'characters#view'
  # get '/party', to: 'static_pages#about'
  # get '/characters', to: 'static_pages#about'
  root 'static_pages#home' # Sets the home page of the app, Ex. localhost:3000/ to the home page!
  resources :users
  resources :groups
  resources :characters
end
