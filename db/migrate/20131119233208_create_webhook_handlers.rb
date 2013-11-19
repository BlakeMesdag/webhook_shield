class CreateWebhookHandlers < ActiveRecord::Migration
  def change
    create_table :webhook_handlers do |t|
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
