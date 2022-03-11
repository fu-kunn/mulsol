Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :sectors, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show]
  end

  scope module: :public do
    root to: 'customers#top'

    resources :sectors, only: [:new, :create, :edit, :update]
    resources :issues, only: [:new, :create, :edit, :update, :destroy]

    # resources :chats, only: [:index, :show]
    resources :chats, only: [:create]
      get 'chat/:id', to: 'chats#show', as: 'chat'


    resources :customers, only: [:index, :edit, :update, :show] do
      collection do
        get :mypage
        get :unsubscribe
        patch :withdraw
      end
    end

    resources :customers, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
