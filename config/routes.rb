Rails.application.routes.draw do

  root 'home#index'
  get 'pages/users'
  get 'pages/posts'
  get 'users/:id', to: 'users#show'
  get 'posts/:id', to: 'posts#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
