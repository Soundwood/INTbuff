Rails.application.routes.draw do
  # custom routes
  get '/' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  get '/welcome' => 'sessions#welcome'

  root to: "user#show"

  # resource defined routes
  resources :notes
  resources :ed_pursuits do
    resources :notes, only: [:new, :index, :create]
  end
  resources :users, only: [:new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
