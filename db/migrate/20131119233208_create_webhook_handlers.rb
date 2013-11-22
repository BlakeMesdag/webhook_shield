class CreateWebhookHandlers < ActiveRecord::Migration
  def change
    create_table :webhook_handlers do |t|
      t.string :kind
      t.string :url
      t.integer :resource_id

      t.timestamps
    end

    add_index :webhook_handlers, :resource_id
  end
end
