Rails.application.routes.draw do
  root 'sessions#index'
  post '/users' => 'users#create'
  post '/login' => 'sessions#create'
  get '/users/:id/show' => 'users#show'
  delete '/users/:id' => 'users#destroy'

  #services routes
  get '/services/new' => 'services#new'
  post '/services' => 'services#create'
  get '/services/:id/ajax_show' => 'services#ajax_show'
  #end services routes

  #logout
  get '/sessions/destroy' => 'sessions#destroy'

  resources :users
end
