class AddIssueIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :issue_id, :integer
  end
end
