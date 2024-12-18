Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Posts
  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'
  patch 'posts/:id' => 'posts#update'
  post 'posts' => 'posts#create'
  delete 'posts/:id' => 'posts#destroy'
  # Users
  post '/users' => 'users#create'
  get 'users/current' => 'users#show'
  #Sessions 
  post '/sessions' => 'sessions#create'
  #Images 
  post '/images' => 'images#create'
  #Me
  get 'mes' => 'mes#index'
  get '/mes' => 'mes#show'
  patch '/mes/:id' => 'mes#update'
  post '/mes' => 'mes#create'
  delete '/mes/:id' => "mes#destroy"



  # Defines the root path route ("/")
  # root "posts#index"
end
