class ConfigurationsController < ApplicationController
  include ApplicationHelper

  def show
  end

  def update
    current_resource.update_attributes(resource_params)
    redirect_to "/"
  end

  def resource_params
    params.require(:resource).permit(:worker_service_url, :worker_type, :job_class)
  end
end
