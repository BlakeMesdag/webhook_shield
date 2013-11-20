ShopifyHerokuServices::Application.routes.draw do
  get "webhook_handlers/index"
  get "webhook_handlers/create"
  get "webhook_handlers/update"
  get "webhook_handlers/destroy"
  namespace :heroku do
    resources :resources, only: [:show, :create, :update, :destroy]
  end

  post "webhooks/:resource_id", to: WebhooksController.action(:create)

  resources :webhook_handlers

  root to: "webhook_handlers#index"
end
