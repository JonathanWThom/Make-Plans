class AddLatLngToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :latitude, :string
    add_column :activities, :longitude, :string
  end
end
