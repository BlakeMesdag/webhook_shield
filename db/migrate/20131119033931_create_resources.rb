class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :heroku_id
      t.string :plan
      t.string :region
      t.string :callback_url
      t.text :options

      t.string :worker_type, default: "redis"
      t.string :worker_service_url
      t.string :job_class, default: "WebhookJob"

      t.timestamps
    end

    add_index :resources, :heroku_id
  end
end
