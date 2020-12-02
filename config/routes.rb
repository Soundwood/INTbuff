Rails.application.routes.draw do
  # custom routes
  get '/' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  get '/welcome' => 'sessions#welcome'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  root to: "user#show"
  # get '*path' => redirect('/')
  # not_found do
  #   status 404
  #   erb :failure
  # end

  # resource defined routes
  resources :notes
  resources :goals
  resources :ed_pursuits do
    resources :notes, only: [:new, :index, :create]
  end
  resources :users
  # , only: [:new, :create, :destroy, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
