class ChangeCloumnsNotnullAddContacts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :contacts, :company_name, false
  end
end
