Rails.application.routes.draw do
  get 'home/index'
  root "articles#index"
  get "/articles", to: "articles#index"
end
