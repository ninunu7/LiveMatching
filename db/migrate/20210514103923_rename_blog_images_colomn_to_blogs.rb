class RenameBlogImagesColomnToBlogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :blog_images, :blog_image
  end
end
