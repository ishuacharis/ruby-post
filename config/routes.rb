Rails.application.routes.draw do
  get 'sessions/new' => "sessions#new"
  post 'sessions/create' => "sessions#create"
  get 'sessions/destroy' => "sessions#destroy"
  get 'users/new' => "users#new"
  post 'users/create' => "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "sessions#new"
  resources :post
end
