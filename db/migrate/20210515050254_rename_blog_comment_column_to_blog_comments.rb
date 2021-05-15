class RenameBlogCommentColumnToBlogComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :blog_comments, :blog_comment, :comment
  end
end
