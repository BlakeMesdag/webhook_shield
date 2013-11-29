class ConfigurationsController < ApplicationController
  include ApplicationHelper

  before_filter :verify_login

  def show
  end

  def update
    current_resource.update_attributes(resource_params)
    redirect_to "/"
  end

  private

  def verify_login
    if Rails.env.production?
      render text: "Login through heroku required" unless session[:resource_id]
    end
  end

  def resource_params
    params.require(:resource).permit(:worker_service_url, :worker_type, :job_class, :redis_namespace, :target_queue)
  end
end
