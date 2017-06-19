class AddInvitedUsersToInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_invitations do |t|
      t.string :user_email
      t.integer :invitation_id

      t.timestamps
    end
  end
end
