class ChangeDataGenderToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :gender, :integer
  end
end
