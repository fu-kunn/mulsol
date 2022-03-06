class RenameSectorNameColumnToSectors < ActiveRecord::Migration[6.1]
  def change
    rename_column :sectors, :sector_name, :name
  end
end
