Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  root 'items#index'
  get 'edit' => 'users#edit'

  resources :users, only: [:show, :new, :edit, :update] do
    resources :cards, only: [:index, :new] do
      # cards controllerはモデルを持たない。データはpayjpに格納
      member do
        get 'pay' #カード決済アクション
        get 'card_delete'
        get 'card_new' #カード登録アクション(newとは違いviewを持たない)
      end
    end
    collection do
      get 'signup/:url',action: 'new'
      get 'mypage/:url',action: 'edit'
    end
  end

  resources :items do
    member do
      get 'confirm' #購入確認画面
    end
    collection do
      get 'search'
    end
    resources :categories, only: [:search]
  end

  resources :categories, only: :show
end
