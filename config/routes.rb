Rails.application.routes.draw do

  devise_for :users

  get 'dashboard', to: 'users#dashboard'
  resources :projects, only: [:new, :create, :show]

  root 'pages#index'
end
