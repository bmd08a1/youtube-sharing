Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :posts
  get 'filter_posts' => 'posts#filter'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'

  get 'search' => 'youtube#search'
  get 'get_player' => 'youtube#get_player'
end
