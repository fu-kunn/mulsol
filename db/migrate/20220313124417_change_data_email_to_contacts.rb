class ChangeDataEmailToContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :email, :string, null: false
  end
end
