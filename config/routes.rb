Rails.application.routes.draw do

  namespace :admin do
    resources :news
    resources :knowledges
  end

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout

  scope :admin do
    get 'users' => 'users#index', as: :users
  end

  root 'welcome#index'
end
