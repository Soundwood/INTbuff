Rails.application.routes.draw do
  # custom routes
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  # resource defined routes
  resources :notes
  resources :ed_pursuits do
    resources :notes, only: [:new, :index, :show]
  end
  resources :users, only: [:new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
