Rails.application.routes.draw do
  get 'users/new'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/home', to: 'static_pages#home' # Not sure if this is necessary along with the root line below!
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  root 'static_pages#home' # Sets the home page of the app, Ex. localhost:3000/ to the home page!
  resources :users
end
