class ResqueWebhookHandler < WebhookHandler
  def forward(env, params)
    puts env.inspect
    puts params.inspect
  end
end
