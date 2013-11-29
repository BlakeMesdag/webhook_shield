class AddTargetQueueToResource < ActiveRecord::Migration
  def change
    add_column :resources, :target_queue, :string, default: "webhooks"
  end
end
