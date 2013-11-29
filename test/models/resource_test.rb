require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  def setup
    @resource = resources(:resque)
  end

  test "forward with resque queues a job with sidekiq" do
    Sidekiq::Client.expects(:push).with('queue' => 'webhooks', 'class' => 'WebhookJob', 'args' => [{:data => 'data', :headers => 'some'}])
    @resource.forward("some", "data")
  end

  test "forward with sidekiq queues a job" do
    Sidekiq::Client.expects(:push).with('queue' => 'webhooks', 'class' => 'WebhookJob', 'args' => [{:data => 'data', :headers => 'some'}])
    @resource.worker_type = "sidekiq"
    @resource.forward("some", "data")
  end

  test "webhook_url is correct in production" do
    Rails.env.stubs(:production?).returns(true)
    assert_equal "https://webhookshield.com/webhooks/#{@resource.id}", @resource.webhook_url
  end

  test "webhook_url for everything else" do
    assert_equal "http://localhost:3000/webhooks/#{@resource.id}", @resource.webhook_url
  end

  test "defaults" do
    resource = Resource.create

    assert_equal "resque", resource.worker_type
    assert_equal nil, resource.redis_namespace
    assert_equal "WebhookJob", resource.job_class
    assert_equal "webhooks", resource.target_queue
    assert_equal "test", resource.plan
    assert_equal nil, resource.worker_service_url
  end
end
