class AddLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
  end
end
