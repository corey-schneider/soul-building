Rails.application.routes.draw do
  devise_for :users
  get 'contact_us', to: 'contact_us#index'
  get 'portfolio', to: 'portfolio#index'
  get 'about', to: 'about#index'
  get 'home', to: 'home#index'
  root 'home#index'

  resources :posts
end
