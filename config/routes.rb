Rails.application.routes.draw do
  get 'contact_us/index'
  get 'portfolio/index'
  get 'about/index'
  get 'home/index'
  root "home#index"
  get "/articles", to: "articles#index"
end
