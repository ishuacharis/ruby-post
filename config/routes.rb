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
    get  'password/forgot/new', to: 'password#new'
    post 'password/create', to: 'password#create'
    get  'password/reset/new', to: 'password#reset_password'
    post 'password/reset', to: 'password#reset'
    get  'password/update/new', to: 'password#update_password'
    patch 'password/update', to: 'password#update'
  end

  # resources :post
  
end
