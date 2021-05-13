Rails.application.routes.draw do
  root :to => 'public/homes#top'
  get 'about' => 'public/homes#about'


  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :public, path: "" do
    get 'customers/mypage' => 'customers#mypage'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resource :customers,only: [:edit,:update]
    resources :items,only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items,except: [:show]
    resources :addresses,only: [:index, :create, :edit, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#show_done'
    resources :orders,only: [:index,:new, :create,:show]
  end

  devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      destroy: 'customers/sessions/destroy'
  }

  namespace :admin do
    root :to => 'homes#top'
    resources :customers, only: [:index,:show,:update,:edit]
    resources :items, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:show, :update]
  end
end
