Rails.application.routes.draw do
  # custom routes
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  # resource defined routes
  resources :notes
  resources :ed_pursuits
  resources :ed_types
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
