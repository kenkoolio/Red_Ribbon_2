Rails.application.routes.draw do
  root 'sessions#index'
  post '/users' => 'users#create'
  post '/login' => 'sessions#create'
  get '/users/:id/show' => 'users#show'
  delete '/users/:id' => 'users#destroy'
  resources :users
end
