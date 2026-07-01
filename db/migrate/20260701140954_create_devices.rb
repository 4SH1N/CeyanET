class CreateDevices < ActiveRecord::Migration[8.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_type
      t.string :brand
      t.string :os
      t.integer :status
      t.string :location
      t.text :note
      t.datetime :last_maintenance

      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
