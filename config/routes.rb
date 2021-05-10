Rails.application.routes.draw do
  devise_for :admin
  root :to => 'public/homes#top'
  get 'about' => 'public/homes#about'
  devise_for :customers
    namespace :admin do
      resources :items, only: [:new, :create, :index, :show, :destroy, :edit, :update]
      resources :genres, only: [:index, :edit, :update, :create]
  end


end
