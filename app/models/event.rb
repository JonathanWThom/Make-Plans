class Event < ActiveRecord::Base
  include Convertable
  has_many :activities, through: :invitations
  has_many :invitations
  belongs_to :user
  after_create :convert_happening_at

  def invitation_rsvps
    invitations.select { |invite| invite.rsvps.present? }
  end
end
