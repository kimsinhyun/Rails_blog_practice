Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
end
