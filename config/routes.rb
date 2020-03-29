Rails.application.routes.draw do
  resources :blogs do
    # collection doでidなどを必要としない固有のルーティングを追加
    collection do
      post :confirm
    end
  end
end
