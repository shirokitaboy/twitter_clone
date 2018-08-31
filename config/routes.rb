Rails.application.routes.draw do
  root 'twtrs#home'
  resources :contacts
  get 'sessions/new'

  resources :twtrs, only: [:index, :new, :create, :edit, :update, :show, :destroy]do
    collection do
      post :confirm
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  get 'favorites', to: 'favorites#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
