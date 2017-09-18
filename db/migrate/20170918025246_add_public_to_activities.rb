class AddPublicToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :public, :boolean, default: false
  end
end
