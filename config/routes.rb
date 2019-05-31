Rails.application.routes.draw do

  devise_for :users,controllers: {
      # omniauth_callbacks: 'users/omniauth_callbacks',
      registrations:      'users/registrations',
      sessions:      'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'               
  resources :users
  resources :mypages,only: [:index, :show]
  get "logout" => "mypages#logout"
  resources :items do
    resources :buy_orders
  end
  resources :user_steps, only: [:index, :show, :update]
end