Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "sessions#new"
  resources :users, only: [:new, :create,]
  resources :sessions, only: [:new, :create,] do
    get 'logout' , on: :collection
  end
  resources :post
end
