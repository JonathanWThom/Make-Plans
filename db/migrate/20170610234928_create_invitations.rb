class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :activity_id
      t.timestamps
    end
  end
end
