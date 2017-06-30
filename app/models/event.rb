class Event < ActiveRecord::Base
  has_many :activities, through: :invitations
  has_many :invitations
  belongs_to :user

  def invitation_rsvps
    invitations.select { |invite| invite.rsvps.present? }
  end
end
