Rails.application.routes.draw do
  resources :tickets do
    member do
      patch :toggle_status
    end
  end
  devise_for :users
  get 'contact_us', to: 'contact_us#index'
  post 'show_phone_number', to: 'contact_us#show_phone_number'
  get 'portfolio', to: 'portfolio#index'
  get 'about', to: 'about#index'
  get 'home', to: 'home#index'
  root 'home#index'

  resources :posts do
    member do
      delete :destroy_photos
      patch :set_cover_photo
    end
  end

  resources :posts
end
