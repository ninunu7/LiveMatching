class AddBlogTitleToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog_title, :string
  end
end
