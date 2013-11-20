class WebhooksController < ActionController::Metal
  def create
    self.response_body = ""
    self.status = 200
    return unless handler = WebhookHandler.where(resource_id: params[:resource_id]).first
    handler.forward(env, params)
  end
end