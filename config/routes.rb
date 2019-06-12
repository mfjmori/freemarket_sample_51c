Rails.application.routes.draw do

  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :new] do
    resource :profiles, only: [:show, :edit]
    resource :addresses, only: [:new,:edit,:create]
    collection do
      get 'address'
      get 'card'
      get 'telephone'
      get 'complete'
      get 'logout'
    end
    resource :cards, only: [:show, :new] do
      collection do
        post "pay", to: "cards#pay"
        post "delete", to: "cards#delete"
      end
    end
  end

  resources :items do
    get "search", on: :collection
    member do
      patch 'stop'
    end
    resources :images
    resources :likes
    resources :comments
    resources :buy_orders, only: :new do
      collection do
        post 'index', to: 'buy_orders#pay'
        post 'pay', to: "buy_order#pay"
      end
    end
  end
  namespace :api do
    resources :categories, only: :index, defaults: { format: 'json' }
  end

  resources :categories, only: :index
end
