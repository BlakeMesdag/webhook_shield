class WebhooksController < ActionController::Metal
  def create
    handler = WebhookHandler.where(resource_id: params[:resource_id]).first
    handler.forward(env, params)

    self.response_body = ""
    self.status = 200
  end
end