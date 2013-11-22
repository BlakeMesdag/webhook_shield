class CreateWebhookHandlers < ActiveRecord::Migration
  def change
    create_table :webhook_handlers do |t|
      t.string :kind
      t.string :url

      t.timestamps
    end
  end
end
