class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :location

      t.timestamps
    end

    add_column :activities, :event_id, :integer
  end
end
