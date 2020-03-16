Rails.application.routes.draw do
  namespace :admin do
    get 'admin_menue/index'
  end
  get 'private_topics/index'
  get 'private_topics/new'
  post 'private_topics/create'
  root 'static_pages#home'
  get 'static_pages/history'
  get 'static_pages/everyday'
  get 'static_pages/support'
  get 'static_pages/entry'
  get 'static_pages/publicinfo'
  get 'static_pages/recruit'
  get 'static_pages/access'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
