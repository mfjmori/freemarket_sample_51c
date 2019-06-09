Rails.application.routes.draw do

  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }
  resources :users, only: [:show, :edit, :new] do
    resource :profiles, only: [:show, :edit]
    resource :addresses, only: [:new,:edit,:create]
    resource :cards, only: [:show, :new, :create]
    collection do
      get 'address'
      get 'card'
      get 'telephone'
      get 'complete'
      get 'logout'
    end
  end

  resources :items do
    resources :buy_orders, only: :new
  end

  resources :categories, only: :index
end
