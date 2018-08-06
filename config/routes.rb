Rails.application.routes.draw do
  resources :twtrs do
    collection do
      post :confirm
    end
  end
end
