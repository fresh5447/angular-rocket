Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
  	resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    match '/up-vote', to: 'votes#up_vote', as: :up_vote, via: [:get, :post]
    match '/down-vote', to: 'votes#down_vote', as: :down_vote, via: [:get, :post]
    resources :favorites, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
