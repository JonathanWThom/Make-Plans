class AddUserEmailToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :user_email, :string
  end
end
