class RenameBlogImageColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :blog_image, :blog_images
  end
end
