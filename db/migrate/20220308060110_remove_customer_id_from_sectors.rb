class RemoveCustomerIdFromSectors < ActiveRecord::Migration[6.1]
  def change
    remove_column :sectors, :customer_id, :integer
  end
end
