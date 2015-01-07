Rails.application.routes.draw do

  root 'welcome#index'

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout

  scope :admin do
    get 'users' => 'users#index', as: :users
  end

  namespace :admin do
    resources :news
  end
end
