class RemoveBlogImagesFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :blog_images, :string
  end
end
