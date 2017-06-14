class CreateInvitationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations_users do |t|
      t.belongs_to :invitation, index: true
      t.belongs_to :user, index: true
    end
  end
end
