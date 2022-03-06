class CreateSectors < ActiveRecord::Migration[6.1]
  def change
    create_table :sectors do |t|
      t.integer :customer_id
      t.string :sector_name, null: false
      t.timestamps
    end
  end
end
