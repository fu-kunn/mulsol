Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
