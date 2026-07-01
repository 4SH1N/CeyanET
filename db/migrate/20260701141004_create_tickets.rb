class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :status

      t.references :client, null: false, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
