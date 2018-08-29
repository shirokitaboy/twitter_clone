Rails.application.routes.draw do
  get 'sessions/new'

  resources :twtrs, only: [:index, :new, :create, :edit, :update, :show, :destroy]do
    collection do
      post :confirm
    end
  end
  get '/', to: 'twtrs#home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  get 'favorites', to: 'favorites#show'
end
