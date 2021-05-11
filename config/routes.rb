Rails.application.routes.draw do
  root :to => 'public/homes#top'

  devise_for :admin, controllers: {
      sessions: 'admin/sessions',
  }
  get 'about' => 'public/homes#about'

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
  end

  scope module: :public do
    resource :customers
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations'
    }
    resources :items,only: [:index, :show]
  end

end
