Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "sessions#new"
  resources :users, only: [:new, :create, :edit, :update,]
  resources :sessions, only: [:new, :create,] do
    get 'logout' , on: :collection
  end
  scope '/:username' do
    resources :post 
  end
  scope 'settings' do
    get  'password/forgot/new', to: 'passwords#new'
    post 'password/create', to: 'passwords#create'
    get  'password/reset/new', to: 'passwords#reset_password'
    post 'password/reset', to: 'passwords#reset'
    get  'password/update/new', to: 'passwords#update_password'
    patch 'password/update', to: 'passwords#update'
  end

  # resources :post
  
end
