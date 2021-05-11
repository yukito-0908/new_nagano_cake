Rails.application.routes.draw do
  root :to => 'public/homes#top'
  get 'about' => 'public/homes#about'


  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :public, path: "" do
    get 'customers/mypage' => 'customers#mypage'
    resource :customers
    resources :items,only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items,except: [:show]
    resources :addresses,only: [:index, :create, :edit, :update, :destroy]
    get 'orders/confirm' => 'orders#show'
    resource :orders,only: [:new, :create]
  end

  devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      destroy: 'customers/sessions'
  }


  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
  end



end
