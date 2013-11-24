class Resource < ActiveRecord::Base

  before_save :default_plan_to_test

  def webhook_url
    if Rails.env.production?
      "https://webhookshield.com/webhooks/#{id}"
    else
      "http://localhost:3000/webhooks/#{id}"
    end
  end

  private

  def default_plan_to_test
    self.plan ||= "test"
  end
end
