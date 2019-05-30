Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'               
  resources :users
  resources :cards
  resources :mypages,only: [:index, :show]
  get "logout" => "mypages#logout"
  resources :items do
    resources :buy_orders
  end
end
