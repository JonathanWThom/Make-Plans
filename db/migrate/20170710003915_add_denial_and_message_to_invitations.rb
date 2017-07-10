class AddDenialAndMessageToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :denial, :boolean, default: false
    add_column :invitations, :denial_message, :text
  end
end
