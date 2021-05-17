class ChangeColumnDefaultToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :user_status, from: nil, to: "true"
  end
end
