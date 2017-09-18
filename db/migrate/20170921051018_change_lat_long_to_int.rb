class ChangeLatLongToInt < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :latitude
    remove_column :activities, :longitude
    add_column :activities, :latitude, :integer
    add_column :activities, :longitude, :integer
  end
end
