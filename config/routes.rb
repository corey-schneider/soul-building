Rails.application.routes.draw do
  get 'portfolio/index'
  get 'about/index'
  get 'home/index'
  root "home#index"
  get "/articles", to: "articles#index"
end
