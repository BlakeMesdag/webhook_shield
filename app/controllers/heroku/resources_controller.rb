class Heroku::ResourcesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  http_basic_authenticate_with name: ENV['HEROKU_USERNAME'], password: ENV['HEROKU_PASSWORD'], except: [:show]

  before_filter :check_region, only: [:create]

  respond_to :json

  def show
    pre_token = params[:id] + ':' + ENV['SSO_SALT'] + ':' + params[:timestamp]
    token = Digest::SHA1.hexdigest(pre_token).to_s
    return render_unauthorized if token != params[:token] || timestamp_out_of_sync?

    session[:resource_id] = Resource.find(params[:id].to_i).id

    cookies['heroku-nav-data'] = params['nav-data']
    session[:heroku_sso] = params['nav-data']
    session[:email]      = params[:email]

    redirect_to '/'
  end

  def create
    resource = Resource.create(resource_params)

    render json: {
      id: resource.id,
      config: {'WEBHOOKPROXY_URL' => resource.webhook_url},
      message: "You're all setup to accept webooks at ..."
    }
  end

  def update
    resource = Resource.where(id: params[:id].to_i).first
    resource.update_attributes(plan: params[:plan])

    render json: {}
  end

  def destroy
    resource = Resource.where(id: params[:id].to_i).first
    resource.destroy

    render nothing: true, status: 200
  end

  private

  def check_region
    return if !params[:region]
    return if params[:region] == 'amazon-web-services::us-east-1'

    render json: {error: "Region is not currently supported"}, status: 422
  end

  def render_unauthorized
    render nothing: true, status: 403
  end

  def timestamp_out_of_sync?
    params[:timestamp].to_i < (Time.now - 2*60).to_i
  end

  def resource_params
    params.permit(:heroku_id, :plan, :region, :callback_url, :options)
  end
end
