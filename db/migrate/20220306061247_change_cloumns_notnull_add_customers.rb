class ChangeCloumnsNotnullAddCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :company_name, false
    change_column_null :customers, :company_name_kana, false
    change_column_null :customers, :post_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :tel, false
  end
end
