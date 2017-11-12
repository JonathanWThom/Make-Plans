class Event < ActiveRecord::Base
  include Convertable
  has_many :activities, through: :invitations
  has_many :invitations
  belongs_to :user
  validates :happening_at_string, :invitee_email, presence: true
  after_create :convert_happening_at
  validates_with FutureDateValidator

  def invitation_rsvps
    invitations.select { |invite| invite.rsvps.present? }
  end
end
