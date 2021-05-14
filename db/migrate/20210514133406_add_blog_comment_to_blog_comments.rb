class AddBlogCommentToBlogComments < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_comments, :blog_comment, :text
  end
end
