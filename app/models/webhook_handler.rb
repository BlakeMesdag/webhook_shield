class WebhookHandler < ActiveRecord::Base
  # override this in subclasses
  def forward(*args); end
end
