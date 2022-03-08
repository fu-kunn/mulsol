class RemoveSectorIdFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :status, :integer
  end
end
