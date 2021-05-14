class AddBlogIdToBlogImages < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_images, :blog_id, :integer
  end
end
