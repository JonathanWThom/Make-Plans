class DeclineInvitations < ActiveRecord::Migration[5.0]
  def change
    rename_column :invitations, :denial, :declined
    rename_column :invitations, :denial_message, :message
  end
end
