class AddDatetimeToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :happening_at, :datetime
  end
end
