Rails.application.routes.draw do


  namespace :admin do
    resources :downloads
  end

  get 'laws' => 'laws#index', as: :laws

  get 'knowledges' => 'knowledges#index', as: :knowledges
  get 'knowledges/:id' => 'knowledges#show', as: :knowledge

  get 'news' => 'news#index', as: :news_index
  get 'news/:id' => 'news#show', as: :news

  namespace :admin do
    resources :news
    resources :knowledges
    resources :laws
    resources :counters, only: [:index, :edit, :update]
  end

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout

  scope :admin do
    get 'users' => 'users#index', as: :users
  end

  root 'welcome#index'
end
