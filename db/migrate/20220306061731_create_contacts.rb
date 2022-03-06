class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :customer_id
      t.integer :subject, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end
