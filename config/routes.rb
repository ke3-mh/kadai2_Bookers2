Rails.application.routes.draw do
  root to: 'homes#top'
  
  get 'homes/about' => 'homes#about', as: "about"
  resources :users, only: [:show, :edit]
  resources :books, only: [:new, :index, :show, :edit]
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
