Rails.application.routes.draw do

  devise_for :installs
  resources :posts
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
