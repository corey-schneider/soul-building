Rails.application.routes.draw do
  get 'about/index'
  get 'home/index'
  root "articles#index"
  get "/articles", to: "articles#index"
end
