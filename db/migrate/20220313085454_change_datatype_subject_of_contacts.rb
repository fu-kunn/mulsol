class ChangeDatatypeSubjectOfContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :subject, :string
  end
end
