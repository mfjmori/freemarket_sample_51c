Rails.application.routes.draw do

  root 'items#index'
  devise_for :users
  resources :users, only: [:edit] do
    resource :profiles, only: [:edit]
    resource :addresses, only: [:edit]
  end
  resources :cards, only: [:index, :new, :create]
  get "users/logout" => "users#logout"
  resources :items do
    resources :buy_orders, only: :new
  end
end
