class ChangeEventDateToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :date, :datetime
    rename_column :events, :date, :happening_at
  end
end
