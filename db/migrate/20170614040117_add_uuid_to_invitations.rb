class AddUuidToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
