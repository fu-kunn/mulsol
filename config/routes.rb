Rails.application.routes.draw do

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

  # 管理者
  namespace :admin do
    get '/' => 'homes#top'
    resources :sectors, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show]
    resources :contacts, only: [:index, :show]
  end


  # 顧客
  scope module: :public do
    root to: 'customers#top'
    get 'search' => 'searches#search'

    resources :sectors, only: [:create, :show]
    resources :issues, only: [:new, :create, :edit, :update, :destroy]
    resources :chats, only: [:create]
      get 'chat/:id', to: 'chats#show', as: 'chat'
    resources :contacts, only: [:new, :create]
      post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
      post 'contacts/back', to: 'contacts#back', as: 'back'
      get 'done', to: 'contacts#done', as: 'done'

    resources :customers, only: [:index, :edit, :update, :show] do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :notifications, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
