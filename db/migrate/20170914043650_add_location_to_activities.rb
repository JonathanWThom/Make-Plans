class AddLocationToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :location, :string
  end
end
