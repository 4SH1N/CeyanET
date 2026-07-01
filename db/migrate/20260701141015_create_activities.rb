class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      t.text :content

      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
