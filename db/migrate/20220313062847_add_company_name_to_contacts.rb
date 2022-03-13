class AddCompanyNameToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :company_name, :string
  end
end
