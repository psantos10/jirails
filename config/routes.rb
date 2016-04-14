Rails.application.routes.draw do

  devise_for :users

  get 'dashboard', to: 'users#dashboard'
  resources :projects, only: [:new, :create, :show] do
    get 'members', to: 'projects#members'
    get 'settings', to: 'projects#settings'

    # TODO: in future, this should be called by AJAX
    get 'add_user', to: 'projects#add_user'
    post 'add_user', to: 'projects#save_user'
  end

  root 'pages#index'
end
