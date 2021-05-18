class AddJoinDayToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :join_day, :date
  end
end
