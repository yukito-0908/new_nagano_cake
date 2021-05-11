Rails.application.routes.draw do
  root :to => 'public/homes#top'
  get 'about' => 'public/homes#about'


  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      destroy: 'customers/sessions'
  }


  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
  end

  namespace :public, path: "" do
    resource :customers

    resources :items,only: [:index, :show]
    resources :cart_items, only: [:index,:delete,:update,:create]
  end

end
