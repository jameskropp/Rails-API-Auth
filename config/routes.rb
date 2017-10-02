Rails.application.routes.draw do
  root   'home#index'
  get    'auth'       => 'home#auth'
  
  post   'user_token'      => 'user_token#create'
  
  get    'users'           => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
end
