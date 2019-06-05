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
  end
<<<<<<< Updated upstream
  resources :cards, only: [:index, :new, :create]
  get "users/logout" => "users#logout"
=======
>>>>>>> Stashed changes
  resources :items do
    resources :buy_orders, only: :new
  end
end
