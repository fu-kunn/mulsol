class RemoveCustomerIdIntegerFromContacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :customer_id：integer, :string
  end
end
