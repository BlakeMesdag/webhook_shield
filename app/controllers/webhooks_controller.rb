class WebhooksController < ActionController::Metal
  def create
    self.response_body = ""
    self.status = 200
    return unless resource = Resource.where(id: params[:resource_id].to_i).first
    resource.forward(request.headers["HTTP_X_SHOPIFY_HMAC_SHA256"], request.body.read)
  rescue => e
    Rails.logger.info "Exception raised: #{e.message}"
  end
end