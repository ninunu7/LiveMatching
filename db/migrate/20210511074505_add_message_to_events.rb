class AddMessageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :message, :text
  end
end
