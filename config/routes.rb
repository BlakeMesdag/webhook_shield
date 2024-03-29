WebhookShield::Application.routes.draw do
  namespace :heroku do
    resources :resources, only: [:show, :create, :update, :destroy]
  end

  post "sso/login", to: "heroku/resources#show"

  post "webhooks/:resource_id", to: WebhooksController.action(:create)

  resource :configuration, only: [:show, :update]

  root to: "configurations#show"
end
