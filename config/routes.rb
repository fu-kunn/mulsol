Rails.application.routes.draw do
  namespace :public do
    get 'sectors/new'
    get 'sectors/edit'
  end
  namespace :public do
    get 'chats/index'
    get 'chats/show'
  end
  namespace :public do
    get 'customers/top'
  end
  namespace :admin do
    get 'sectors/index'
    get 'sectors/edit'
  end
  get 'sectors/index'
  get 'sectors/edit'
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
  end

  scope module: :public do
    root to: 'customers#top'

    resources :issues, only: [:new, :create, :edit, :update]
    resources :chats, only: [:index, :show]

    # ニーズ・課題の表示訂正のためshowアクションを
    resources :customers, only: [:index, :edit, :update, :show] do
      collection do
        get :mypage
        get :unsubscribe
        patch :withdraw
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
