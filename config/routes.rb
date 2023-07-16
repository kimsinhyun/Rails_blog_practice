Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :posts do
    resources :comments
  end
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
end
