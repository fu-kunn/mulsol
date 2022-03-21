class AddRelationshipToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :relationship_id, :integer
  end
end
