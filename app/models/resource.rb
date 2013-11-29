require 'sidekiq'

class Resource < ActiveRecord::Base
  before_save :default_plan_to_test

  def webhook_url
    if Rails.env.production?
      "https://webhookshield.com/webhooks/#{id}"
    else
      "http://localhost:3000/webhooks/#{id}"
    end
  end

  # Empty interface, implement later
  def forward(headers, params)
    case worker_type
      when 'resque', 'sidekiq'
        Sidekiq.configure_client do |config|
          config.redis = sidekiq_client_args
        end

        Sidekiq::Client.push(sidekiq_push_args(headers, params))
        Sidekiq.instance_variable_set(:@redis, nil)
        Rails.logger.info "Successfully forwarded webhook for #{id}"
      else
        Rails.logger.info "Attempted to push job for resource #{id} but worker type is not currently valid!"
    end

    return
  end

  def sidekiq_client_args
    args = {
      url: worker_service_url
    }
    args.merge!(namespace: redis_namespace) if redis_namespace
    args
  end

  private

  def sidekiq_push_args(headers, params)
    {
      'queue' => target_queue,
      'class' => job_class,
      'args' => [params: params, headers: headers]
    }
  end

  def default_plan_to_test
    self.plan ||= "test"
  end
end
