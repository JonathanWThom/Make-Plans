class AddInviteeEmailToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :invitee_email, :string
  end
end
