class RemoveJoinDateFromClients < ActiveRecord::Migration[8.1]
  def change
    remove_column :clients, :join_date, :date
  end
end
