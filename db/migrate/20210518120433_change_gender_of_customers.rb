class ChangeGenderOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :gender, :string, default: 0
  end

  def down
    change_column :customers, :gender, :string
  end
end
