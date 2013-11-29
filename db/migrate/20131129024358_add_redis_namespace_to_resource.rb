class AddRedisNamespaceToResource < ActiveRecord::Migration
  def change
    add_column :resources, :redis_namespace, :string
  end
end
