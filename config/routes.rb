ShopifyHerokuServices::Application.routes.draw do
  namespace :heroku do
    resources :resources, only: [:show, :create, :update, :destroy]
  end
end
