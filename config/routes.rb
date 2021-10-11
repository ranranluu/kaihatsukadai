Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ルート画面の設定と、各コントローラーで使用できるアクションの限定
  root to: 'homes#top'
  resources :posts, except: [:show]
  resources :users, only: [:show, :edit, :update]
end
