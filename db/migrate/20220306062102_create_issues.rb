class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.integer :customer_id
      t.text :needs, null: false
      t.text :challenge, null: false
      t.timestamps
    end
  end
end
