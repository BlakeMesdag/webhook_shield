module ApplicationHelper
  def current_resource
    if Rails.env.production?
      @resource ||= Resource.find(session[:resource_id])
    else
      @resource ||= Resource.first
    end
  end
end
