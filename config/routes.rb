Rails.application.routes.draw do
  resources :posts
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
end
