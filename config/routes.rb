Rails.application.routes.draw do
  devise_for :users
  get 'contact_us/index'
  get 'portfolio/index'
  get 'about/index'
  get 'home/index'
  root "home#index"
  get "/articles", to: "articles#index"
end
