Rails.application.routes.draw do
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'search', to: 'search#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/u/:id', to: 'users#profile', as: 'user'
  resources :after_signup

  resources :posts do
    resources :comments
  end
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
end
