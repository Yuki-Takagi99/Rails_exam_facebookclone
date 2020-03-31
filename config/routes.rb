Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs do
    # collection doでidなどを必要としない固有のルーティングを追加
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]
end
