class AddCustomerIdToBlogComments < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_comments, :customer_id, :integer
  end
end
