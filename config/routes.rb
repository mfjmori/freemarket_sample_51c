Rails.application.routes.draw do

  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :new] do
    resource :profiles, only: [:show, :edit]
    resource :addresses, only: [:edit]
    collection do
      get 'address'
      get 'card'
      get 'telephone'
      get 'complete'
      get 'logout'
    end
    resource :cards, only: [:show, :new] do
      collection do
        post "show", to: "cards#show"
        post "pay", to: "cards#pay"
        post "delete", to: "cards#delete"
      end
    end
  end

  resources :items do
    resources :buy_orders, only: :new do
      collection do
        post 'index', to: 'buy_orders#pay'
        post 'pay', to: "buy_order#pay"
      end
    end
  end
end
