Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resource :user, only: [:new, :create, :edit]
  get 'user/:id' => 'users#show', as: :user_show
  get 'users' => 'users#index', as: :index_user
  patch '/user' => 'users#update', as: :update_user
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resource :bookmarks, only: [:create, :destroy]
  get 'bookmarks' => 'bookmarks#index', as: :index_bookmaks

  resources :cookings, only: [:new, :create, :index, :edit, :update, :show, :destroy] do
    resources :cooking_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get 'rankings' => 'cookings#ranking', as: :cooking_rankings
end
