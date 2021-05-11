class AddBlogTextToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog_text, :text
  end
end
