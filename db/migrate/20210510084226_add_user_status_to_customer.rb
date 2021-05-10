class AddUserStatusToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :user_status, :boolean
  end
end
