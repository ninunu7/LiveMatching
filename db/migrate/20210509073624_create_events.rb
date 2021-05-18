class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :join_day
      t.string :artist_name
      t.text :message
      t.integer :customer_id
      t.timestamps
    end
  end
end
