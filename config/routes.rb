Rails.application.routes.draw do
  resources :photos, only: [:index, :create, :new]
  end
 
  resources :entry_topics, only: [:index, :new, :edit, :create, :update, :destroy]
  
  namespace :admin do
    resources :contacts
  end
  
  namespace :user do
    resources :contacts
  end
  
  get 'public_topics/index'
  get 'public_topics/new'
  post 'public_topics/create'
  get 'public_topics/:id/edit', to: 'public_topics#edit', as: 'public_topics_edit'
  patch 'public_topics/:id/update', to: 'public_topics#update', as: 'public_topics_update'
  get 'public_topics/:id/destroy', to: 'public_topics#destroy', as: 'public_topics_destroy'
  namespace :admin do
    get 'admin_menue/index'
    get 'admin_menue/user_edit'
    get 'admin_menue/import_form'
    get 'admin_menue/users_index'
    get 'admin_menue/search'
  end
  get 'private_topics/index'
  get 'private_topics/new'
  get 'private_topics/show/:id', to:'private_topics#show', as: 'private_topics_show'
  post 'private_topics/create'
  get 'private_topics/:id/edit', to: 'private_topics#edit', as: 'private_topics_edit'
  patch 'private_topics/:id/update', to: 'private_topics#update', as: 'private_topics_update'
  get 'private_topics/:id/destroy', to: 'private_topics#destroy', as: 'private_topics_destroy'
  root 'static_pages#home'
  get 'static_pages/history'
  get 'static_pages/everyday'
  get 'static_pages/support'
  get 'static_pages/recruit'
  get 'static_pages/access'
  
  resources :users do
    collection {post :import}
  end
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
