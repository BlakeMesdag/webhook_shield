ShopifyHerokuServices::Application.routes.draw do
  namespace :heroku do
    resources :resources, only: [:show, :create, :update, :destroy]
  end

  post "webhooks/:resource_id", to: WebhooksController.action(:create)

  resource :configuration, only: [:show, :update]

  root to: "configurations#show"
end
