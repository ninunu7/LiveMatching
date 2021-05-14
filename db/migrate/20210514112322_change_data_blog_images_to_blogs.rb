class ChangeDataBlogImagesToBlogs < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs,:blog_images,:string
  end
end
