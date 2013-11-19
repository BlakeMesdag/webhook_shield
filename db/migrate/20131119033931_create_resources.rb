class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :heroku_id
      t.string :plan
      t.string :region
      t.string :callback_url
      t.text :options

      t.timestamps
    end

    add_index :resources, :heroku_id
  end
end
