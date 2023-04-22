Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'posts' => 'posts#index'
  resource :posts

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'
end
