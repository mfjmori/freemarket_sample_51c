Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resource :profiles only: :show
  end
  resources :mypages
  resources :items
end

