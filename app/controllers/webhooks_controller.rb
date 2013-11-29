class WebhooksController < ActionController::Metal
  def create
    self.response_body = ""
    self.status = 200
    return unless resource = Resource.where(id: params[:resource_id].to_i).first
    resource.forward(request.headers, params)
  rescue => e
    Rails.logger.info "Exception raised: #{e.message}"
  end
end