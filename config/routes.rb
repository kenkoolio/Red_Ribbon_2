Rails.application.routes.draw do
  root 'sessions#index'
  get '/users/new' => 'users#new'
end
